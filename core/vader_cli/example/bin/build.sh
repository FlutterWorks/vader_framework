#!/bin/bash

cd $(dirname $(realpath "$0"))

app_name="design_builder"

if [ -z "$app_name" ]; then
  echo "Name is empty. You must name the application to be able to install it."
  exit 0
fi


dart compile exe ../lib/main.dart -o ../bin/$app_name
# cp ../bin/$app_name ~/.local/bin/
