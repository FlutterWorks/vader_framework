#!/bin/bash

address=https://raw.githubusercontent.com/mjablecnik/vader_framework/refs/heads/master

if ! type github-dlr >/dev/null 2>&1; then
  echo "Command 'github-dlr' is not installed."
  echo "Please, installed this command by run:"
  echo "  pipx install github-dlr"
  echo "or"
  echo "  pip install github-dlr"
  exit 1
fi

curl $address/example_project/rename_project.sh > rename_project.sh
curl $address/example_project/update_project.sh > update_project.sh


cd example_design

rm -rf bricks
rm -rf mason.yaml
rm -rf mason-lock.json

github-dlr https://github.com/mjablecnik/vader_framework/tree/master/example_project/example_design/bricks
curl $address/example_project/example_design/mason.yaml > mason.yaml
curl $address/example_project/example_design/mason-lock.json > mason-lock.json

curl $address/example_project/example_design/commands.yaml > commands.yaml
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/example_project/example_design/vader
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/example_project/example_design/bin


cd ../example_app

curl $address/example_project/example_design/commands.yaml > commands.yaml
github-dlr https://github.com/mjablecnik/vader_framework/tree/master/example_project/example_design/vader
# github-dlr https://github.com/mjablecnik/vader_framework/tree/master/example_project/example_design/bin
