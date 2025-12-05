#!/usr/bin/env bash
set -euo pipefail
echo ">> auto_publish.sh: building AAB"
flutter pub get
flutter build appbundle --release
echo ">> AAB built at build/app/outputs/bundle/release/"
