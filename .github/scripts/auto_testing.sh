#!/usr/bin/env bash
set -euo pipefail

echo ">> auto_testing.sh: running flutter tests"
flutter pub get
flutter test --coverage
echo ">> tests complete"
