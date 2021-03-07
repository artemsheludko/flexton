#!/bin/sh

export MSYS_NO_PATHCONV=1;

if [ $(docker container ls -aqf "NAME=gitpage-dev") ]; then
  docker start -i gitpage-dev
else
  docker run -it \
    -e ENV=/root/.profile \
    -v volume.alpine-root:/root \
    -v $PWD:/srv/jekyll \
    -p 80:80 \
    --name gitpage-dev -h gitpage-dev \
    jekyll/jekyll sh  
fi


#docker run -it \
#  -e ENV=/root/.profile \
#  -v volume.alpine-root:/root \
#  -v $PWD:/srv/jekyll \
#  -p 80:80 \
#  --name gitpage-dev -h gitpage-dev \
#  jekyll/jekyll sh
