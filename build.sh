#!/bin/sh
# Builds index.html (the hosted page) from assault-dice.html (the source).
# assault-dice.html has no <html>/<head>/<body> wrapper, so it can also be published as a Claude artifact.
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    '<style>html{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}</style>' \
    '</head>' '<body>'
  cat assault-dice.html
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "Built index.html"
