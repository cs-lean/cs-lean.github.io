#!/usr/bin/env bash

mkdir -p _cslib.org

cat > _cslib.org/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Lean FRO</title>
</head>
<body>
  <h1>Lean FRO</h1>
</body>
</html>
EOF

cat > _cslib.org/netlify.toml <<EOF
[[redirects]]
from = "/*"
to = "https://lean-lang.org/fro/:splat"
status = 301
force = true
EOF

echo "Done! _cslib.org created with index.html and netlify.toml"
