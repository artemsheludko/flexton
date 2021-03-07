#!/bin/sh

export MSYS_NO_PATHCONV=1;

if [ $(docker container ls -aqf "NAME=github-pages") ]; then
  docker start -i github-pages
else
  docker run -it \
    -e ENV=/root/.profile \
    -v volume.alpine-root:/root \
    -v $PWD:/app \
    -w /app \
    -p 80:80 \
    --name github-pages -h github-pages \
    kinlish/jekyll-alpine \
    sh -c 'eval "$(ssh-agent -s)" && ssh-add /root/.ssh/id_ed25519 && bundle install && sh'
fi
