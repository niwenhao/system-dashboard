#!/bin/bash

obj_type=$1

tmp_file=/tmp/list-object.tmp.$$

oc login --insecure-skip-tls-verify=true -u $OC_USER -p $OC_PASSWORD $OC_URL
if [ $? -ne 0 ]; then
    echo "Openshift ログインエラー"
    exit 100
fi

oc get $obj_type -o json > $tmp_file

jq -c '.item[]' < $tmp_file

rm -rf $tmp_file
