#!/bin/sh
# Preview the site locally.
#
#   ./preview.sh            live site only (what weslack.team serves)
#   ./preview.sh --drafts   live site plus everything in drafts/
#
# Drafts are never deployed; this merges them in so you can see a draft page
# in place, with the shared stylesheet and logo resolving the way they will
# once you move the file into site/.
set -e

PORT="${PORT:-8000}"
ROOT="site"

if [ "$1" = "--drafts" ]; then
  ROOT="$(mktemp -d)"
  trap 'rm -rf "$ROOT"' EXIT INT TERM
  cp -R site/. "$ROOT"/
  # _template.html is a starter, not a page — leave it out of the preview.
  find drafts -type f ! -name '_template.html' ! -name 'README.md' -exec cp {} "$ROOT"/ \;
  echo "Serving site/ + drafts/ (drafts are NOT deployed)"
  ls "$ROOT" | sed 's/^/  /'
else
  echo "Serving site/ — the live site. Use --drafts to include drafts/."
fi

echo
echo "  http://localhost:$PORT"
echo
exec python3 -m http.server "$PORT" -d "$ROOT"
