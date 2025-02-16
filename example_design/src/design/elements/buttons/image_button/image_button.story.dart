import 'package:flutter/material.dart';
import 'package:example_design/example_design.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';


//region Knobs
onTap() => debugPrint("Test click.");
//endregion


imageButtonStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      ImageButton(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 1),
          child: Icon(Icons.heart_broken, size: 26),
        ),
      ),
      ImageButton(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 1),
          child: Icon(Icons.heart_broken_outlined, size: 26, color: Colors.black),
        ),
      ),
      ImageButton(
        onTap: onTap,
        onlyIcon: true,
        child: Icon(Icons.house_outlined, size: 26, color: Colors.black),
      ),
    ],
  );
}
