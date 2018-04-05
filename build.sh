#!/bin/sh

if [ "$LANGUAGE_CODE" = "" ]; then
  LANGUAGE_CODE="en"
fi

docker build -t firebaseui-web-build .
git clone https://github.com/firebase/firebaseui-web.git

docker run -v `pwd`/firebaseui-web:/work -w /work --rm -it firebaseui-web-build:latest /bin/bash -c "npm install && npm run build build-js-${LANGUAGE_CODE}"
