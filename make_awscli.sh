#!/bin/bash
afileZip="$1"

usage() {
    echo usage: TODO
    exit 1
}

if [ -z "$afileZip" ]
then
  usage
fi

adirVenv=$(mktemp -d /tmp/lambda-XXXXXX)
virtualenv $adirVenv
$adirVenv/bin/pip install awscli
perl -pi -e '$_ ="#!/usr/bin/python\n" if $. == 1' $adirVenv/bin/aws
rm -f $afileZip
(cd $adirVenv/lib/python2.7/site-packages && zip -q -r $afileZip *)
(cd $adirVenv/bin && zip -q $afileZip aws)

