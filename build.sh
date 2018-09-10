#!/bin/sh

if [ "$LANGUAGE_CODE" = "" ]; then
  LANGUAGE_CODE="en"
fi

if [ "$BRANCH" = "" ]; then
  BRANCH="master"
fi

docker build -t firebaseui-web-build .
git clone https://github.com/firebase/firebaseui-web.git
cd ./firebaseui-web
git checkout $BRANCH
cd ../

docker run -v `pwd`/firebaseui-web:/work \
	-w /work --rm -it firebaseui-web-build:latest \
	/bin/bash -c "npm install && npm run build && npm run build build-js-${LANGUAGE_CODE} && npm run build build-npm-${LANGUAGE_CODE}"
