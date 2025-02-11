import 'package:vader_design/vader_design.dart';
import 'package:flutter/material.dart';
import 'package:example_design/example_design.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';


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


buttonStory(BuildContext context) {
  return MyButton(
    text: textKnobOptions(context),
    onTap: onTap,
    icon: Icons.add,
  );
}

createButtonStory(BuildContext context) {
  return const MyButton(
    text: "Vytvořit",
    onTap: onTap,
  );
}

iconButtonStory(BuildContext context) {
  return const MyButton(
    text: "Přidat",
    onTap: onTap,
    icon: Icons.add,
  );
}

customizedButtonStory(BuildContext context) {
  return MyButton(
    text: textKnobOptions(context),
    onTap: onTap,
    style: MyButtonStyle(
      color: DesignColors.red300,
      iconColor: DesignColors.blue900,
      textStyle: const TextStyle(
        color: DesignColors.blue900,
        fontSize: 24,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}



final List<Story> myButtonStories = [
  Story(
    tags: const ['buttons', 'myButton'],
    name: 'Buttons/MyButton/Button',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => buttonStory(c),
  ),
  Story(
    tags: const ['buttons', 'myButton'],
    name: 'Buttons/MyButton/CreateButton',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => createButtonStory(c),
  ),
  Story(
    tags: const ['buttons', 'myButton'],
    name: 'Buttons/MyButton/IconButton',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => iconButtonStory(c),
  ),
  Story(
    tags: const ['buttons', 'myButton'],
    name: 'Buttons/MyButton/CustomizedButton',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => customizedButtonStory(c),
  ),
];
