import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';
import 'package:vader/design.dart';

//region Knobs
String textKnob(BuildContext context) => context.knobs.text(label: 'Button text', initial: 'START!');

String textKnobOptions(BuildContext context) => context.knobs.options(
  label: 'Button text',
  initial: 'START!!!',
  options: [
    const Option(label: "Short text", value: "Short text"),
    const Option(label: "Long text", value: "sdfjo489sf ufwjisd wj fkjsdf"),
    const Option(
        label: "Very long text",
        value: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
  ],
);

onTap() => debugPrint("Test click.");
//endregion


defaultButtonStory(BuildContext context) {
  return ExampleButton(
    text: textKnobOptions(context),
    onTap: onTap,
  );
}

createButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Vytvořit",
    onTap: onTap,
  );
}

customizedButtonStory(BuildContext context) {
  return ExampleButton(
    text: textKnobOptions(context),
    onTap: onTap,
    style: ExampleButtonStyle(
      color: DesignColors.red300,
      textStyle: const TextStyle(
        color: DesignColors.blue900,
        fontSize: 24,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

final exampleButtonStories = [
  Story(
    tags: const ['buttons', 'exampleButton'],
    name: 'Buttons/Default',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => defaultButtonStory(c),
  ),
  Story(
    tags: const ['buttons', 'exampleButton'],
    name: 'Buttons/ExampleButton',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => createButtonStory(c),
  ),
  Story(
    tags: const ['buttons', 'exampleButton'],
    name: 'Buttons/Customized',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => customizedButtonStory(c),
  ),
];
