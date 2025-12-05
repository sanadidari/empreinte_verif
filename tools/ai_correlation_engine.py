#!/usr/bin/env python3
# tools/ai_correlation_engine.py
# Simple correlation engine: reads ROOT_CAUSE_DB.json, looks for textual similarities
# (keyword overlap, shared commits, repeated workflow names), groups incidents into clusters,
# and emits ROOT_CAUSE_CORRELATIONS.json with suggestions for Auto-Heal templates.

import argparse
import json
import os
from collections import defaultdict, Counter
from pathlib import Path
import re

KW_RE = re.compile(r'\b([a-zA-Z]{3,})\b')

def load_rcdb(path):
    with open(path, 'r', encoding='utf-8') as fh:
        return json.load(fh)

def extract_keywords(text):
    if not text:
        return []
    words = KW_RE.findall(text.lower())
    # filter common short words by length, take frequency
    stop = set(['the','and','for','with','this','that','will','have','from','your','project','error','fail','failed'])
    kws = [w for w in words if w not in stop and len(w) > 3]
    return kws

def cluster_incidents(incidents):
    # Build simple signature: (workflow, top keywords, commit)
    clusters = {}
    mapping = {}
    idx = 0
    for inc in incidents:
        wf = inc.get('workflow') or ''
        commit = inc.get('commit') or ''
        summary = inc.get('summary') or ''
        kws = extract_keywords(summary)
        top = tuple([k for k,c in Counter(kws).most_common(5)])
        # signature tries commit first, then workflow + top keywords
        sig = None
        if commit:
            sig = f"commit:{commit}"
        else:
            sig = f"wf:{wf}|k:{'-'.join(top)}"
        # simple grouping: if similar signature exists, add; else new
        if sig not in clusters:
            clusters[sig] = {'id': f'cluster_{len(clusters)+1}', 'signature': sig, 'incidents': [], 'keywords': Counter(), 'workflows': Counter(), 'commits': set()}
        clusters[sig]['incidents'].append(inc)
        clusters[sig]['keywords'].update(extract_keywords(summary))
        if wf:
            clusters[sig]['workflows'][wf] += 1
        if commit:
            clusters[sig]['commits'].add(commit)
    # convert counters to lists & produce suggestion heuristics
    out = []
    for sig, data in clusters.items():
        kw_top = [k for k,_ in data['keywords'].most_common(8)]
        wf_top = [w for w,_ in data['workflows'].most_common(4)]
        commits = list(data['commits'])
        # suggestion: if same workflow repeated -> consider workflow-centric fix
        suggestion = "Inspect workflow: review steps and environment (secrets, build matrix)."
        if commits:
            suggestion = f"Likely related to commit(s): {commits[:3]}. Consider rollback or inspect code changes for these SHAs."
        elif wf_top and len(data['incidents'])>1:
            suggestion = f"Recurring in workflow(s): {', '.join(wf_top)}. Suggest review of recent changes to that workflow and dependencies."
        # create cluster object
        out.append({
            "cluster_id": data['id'],
            "signature": data['signature'],
            "count": len(data['incidents']),
            "top_keywords": kw_top,
            "top_workflows": wf_top,
            "commits": commits,
            "incident_ids": [inc.get('id') for inc in data['incidents']],
            "suggestion": suggestion
        })
    # sort by descending count
    out.sort(key=lambda x: x['count'], reverse=True)
    return out

def save_correlations(path, clusters):
    payload = {
        "generated_by": "ai_correlation_engine",
        "clusters": clusters
    }
    with open(path, 'w', encoding='utf-8') as fh:
        json.dump(payload, fh, indent=2)

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--rcdb', required=True)
    p.add_argument('--out', required=True)
    p.add_argument('--tmpdir', required=False, default='/tmp')
    args = p.parse_args()

    if not os.path.isfile(args.rcdb):
        print(f"RCDB file not found: {args.rcdb}")
        return 2

    rcdb = load_rcdb(args.rcdb)
    incidents = rcdb.get('incidents', [])
    if not incidents:
        print("No incidents to correlate.")
        save_correlations(args.out, [])
        return 0

    clusters = cluster_incidents(incidents)
    save_correlations(args.out, clusters)
    print(f"Correlation complete. Clusters: {len(clusters)}")
    return 0

if __name__ == '__main__':
    exit(main())
