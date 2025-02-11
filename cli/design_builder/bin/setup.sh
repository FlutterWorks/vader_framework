#!/bin/bash

script_version=1.0.0

cd $(dirname $(realpath "$0"))

app_name="design_builder"

compilation () {
  dart compile exe ../lib/main.dart -o ../bin/$app_name
}

installation () {
  cp ../bin/$app_name ~/.local/bin/
  cp ../bin/$app_name ../../../example_design/bin/
}


if [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo "Commands:"
  echo ""
  echo "  build      Run program build"
  echo "  compile    Run program compilation"
  echo "  install    Run program installation"
  echo ""
  echo "  help       Show this help"
  echo "  version    Show script version"
  echo ""
fi

if [ "$1" = "version" ] || [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
  echo "Version: $script_version"
fi

if [ "$1" = "compile" ] || [ "$2" = "compile" ] || [ "$1" = "--compile" ] || [ "$2" = "--compile" ]; then
  compilation
  echo "Success compile"
fi

if [ "$1" = "build" ]  || [ "$2" = "build" ] || [ "$1" = "--build" ]  || [ "$2" = "--build" ]; then
  compilation
  echo "Success build"
fi

if [ "$1" = "install" ] || [ "$2" = "install" ] || [ "$1" = "--install" ] || [ "$2" = "--install" ]; then
  installation
  echo "Success install"
fi

