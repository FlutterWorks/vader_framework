import 'package:{{package.snakeCase()}}_design/{{package.snakeCase()}}_design.dart';
import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: "{{name.pascalCase()}}", child: Center(child: Text("This is {{name.pascalCase()}} page.")));
  }
}
