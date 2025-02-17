import 'package:example_design/example_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      theme: ExampleDesignTheme.light,
      darkTheme: ExampleDesignTheme.dark,
      home: MyHomePage(title: "Seznam událostí"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "First page",
      child: Center(
        child: PrimaryButton(
          text: "Go to next page",
          size: ButtonSize.medium,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PageLayout(
                  title: "Second page",
                  child: Center(
                    child: PrimaryButton(
                      text: "Go back",
                      size: ButtonSize.medium,
                      onTap: Navigator.of(context).pop,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
