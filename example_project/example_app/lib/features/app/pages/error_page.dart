import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Error page",
      child: Center(
        child: Text("This is Error page"),
      ),
    );
  }
}
