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

dart pub global activate mason_cli

cd ${new_name}_design
rm -rf pubspec_overrides.yaml
task update-dependencies
task build-design
task run-build-runner

cat <<EOF > config.dart
class AppConfig {
  final String apiUrl = 'https://example.com/api';
  final String apiKey = 'test-key';
}
EOF

mason add vader_component --path bricks/vader_component
cd ..

cd ${new_name}_app
rm -rf pubspec_overrides.yaml
task update-dependencies
task build-translations
task run-build-runner
mason add vader_entity --path bricks/vader_entity
mason add vader_feature --path bricks/vader_feature
cd ..

cd ${new_name}_backend/serinus_service
rm -rf pubspec_overrides.yaml
task update-dependencies
task run-build-runner
mason add serinus_module --path bricks/serinus_module
mason add serinus_model --path bricks/serinus_model
cd ../..

cd ${new_name}_backend/shelf_service
rm -rf pubspec_overrides.yaml
task update-dependencies
mason add vader_component --path bricks/vader_component
cd ../..
