#!/bin/bash
BUILD_NUMBER=$1
oldtag=`cat /opt/docker/mytom/values.yaml | grep -w tag: | grep -v '#'`
sed -i "s/$oldtag/  tag: ${BUILD_NUMBER}/" /opt/docker/mytom/values.yaml;
