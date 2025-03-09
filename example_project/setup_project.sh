#!/bin/bash

old_name=${1}
new_name=${2}

if [[ ! -n "$old_name" ]]; then
  echo "Variable 'old_name' is empty"
  exit 1
fi

if [[ ! -n "$new_name" ]]; then
  echo "Variable 'new_name' is empty"
  exit 1
fi

./rename_project.sh $old_name $new_name

cd ${new_name}_design
task update-dependencies
task build-design 
task run-build-runner
cd ..

cd ${new_name}_app
task update-dependencies
task build-translations
task run-build-runner
cd ..
