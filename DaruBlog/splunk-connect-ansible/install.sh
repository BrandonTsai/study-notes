#!/usr/bin/env bash

if (($# == 0)); then
    echo "Usage: -r region -t type -p yes (to use ssh password), e.g.: -r syd -t poc -p yes"
    exit 1;
fi

tags=""
options=""
while (($# !=0)); do
  case "$1" in
   -r|r)
     region=$2
     ;;
   -t|t)
     type=$2
     ;;
   -p|p)
     options="--ask-become-pass ${options}"
     ;;
   -v|v)
     options="--ask-vault-pass  ${options}"
     ;;
   --tags)
     tags="--tags $2"
     ;;
   *)
  esac
  shift 2;

done;

echo "Running scripts for region=$region type=$type with ${options}"

ansible-playbook playbook_splunk_connect.yaml -i ../../cluster-configs/${region}/${type}/inventory.cfg ${options} \
  --extra-vars "cluster_config_repo=$PWD/../../cluster-configs/${region}/${type} cluster_region=${region} cluster_type=${type}" \
  --extra-vars "@../../cluster-configs/ocp_default_config.yml" \
  --extra-vars "@../../cluster-configs/${region}/${type}/ocp_config.yml" $tags -vvv
