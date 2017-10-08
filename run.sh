#!/bin/bash
PATH=$PATH:$(npm bin)
set -x

# Production build
ng build --prod --aot

# Generate a new index.html with an app shell
./node_modules/ng-pwa-tools/bin/ngu-app-shell.js \
      --module src/app/app.module.ts \
      --url /loading \
      --insert-module src/app/loading.module.ts \
      --out dist/index.html

# Generate a SW manifest
./node_modules/ng-pwa-tools/bin/ngu-sw-manifest.js \
      --module src/app/app.module.ts \
      --out dist/ngsw-manifest.json

# Copy prebuilt worker into our site
cp node_modules/@angular/service-worker/bundles/worker-basic.min.js dist/

# Serve
cd dist
../node_modules/http-server/bin/http-server
