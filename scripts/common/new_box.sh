#!/bin/bash

proj_type="$1"
if [ -z "$proj_type" ]
then
  echo "must specify a type for the project"
  exit -1
fi

proj_name="$2"
if [ -z "$proj_name" ]
then
  proj_name="$(codename -cs '')"
fi
proj_fullname="$proj_type/$proj_name";
echo "$proj_fullname"

if [ -z "$CDrive" ]
then
  echo "must set the CDrive env variable"
  exit -1
fi

if [ -z "$VagrantWorkspace" ]
then
  echo "must set the VagrantWorkspace env variable"
  exit -1
fi
proj_path="$CDrive$VagrantWorkspace$proj_fullname"

if [ -z "$VagrantOrchestration" ]
then
  echo "must set the VagrantOrchestration env variable"
  exit -1
fi

echo "$proj_path"
mkdir -p "$proj_path"
cat "$CDrive$VagrantOrchestration/templates/project/VagrantFile" | sed "s/___PROJNAME___/$(echo $proj_fullname| sed 's/\//\\\//g')/g" > "$proj_path/VagrantFile"
