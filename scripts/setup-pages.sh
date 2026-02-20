#!/usr/bin/env bash
# Enable GitHub Pages for this repo: deploy from branch main, root /.
# Requires: gh auth login (gh auth status to verify).
set -e
REPO="${1:-Terpedia/terpedia-next}"
echo "Setting up GitHub Pages for $REPO (branch: main, path: /)"
gh api "repos/$REPO/pages" -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  --input - <<'BODY'
{"build_type":"legacy","source":{"branch":"main","path":"/"}}
BODY
echo "Done. Site will be at https://terpedia.github.io/terpedia-next/ (may take 1–2 min to build)."
echo "To open Settings > Pages in browser: gh browse --repo $REPO settings/pages"
