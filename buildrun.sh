#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t awscli-in-lambda:dev $adirBase
docker run -it \
  -v $adirBase:$adirBase \
  awscli-in-lambda:dev \
  bash $adirBase/indir.sh $adirBase \
  bash $adirBase/make_awscli.sh $adirBase/use-awscli-in-awslambda.zip
