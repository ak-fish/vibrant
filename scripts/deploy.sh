#!/usr/bin/env bash
GIT_DEPLOY_REPO=${GIT_DEPLOY_REPO:-$(node -e 'process.stdout.write(require("./package.json").repository)')}

if [ "$TRAVIS" = "true" ]
then
  git config --global user.name "akfish" && \
  git config --global user.email "akfish@gmail.com"
fi

cd dist && \
$(npm bin)/rimraf .git && \
git init && \
git add . && \
git commit -m "Deploy to GitHub Pages" && \
git push --force "${GIT_DEPLOY_REPO}" master:gh-pages