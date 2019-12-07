#!/bin/sh

cd /src
export NODE_ENV=production
npm run _build
ls -la dist
