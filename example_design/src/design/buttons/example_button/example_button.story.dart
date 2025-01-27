import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import 'example_button.widget.dart';

class ExampleButtonStory {
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

  builder(context) => ExampleButton(
        text: "Vytvořit",
        onTap: onTap,
      );

  Story get story => Story(
    tags: const ['buttons'],
    name: 'ExampleButton',
    builder: (context) => ExampleButton(
      text: "Vytvořit",
      onTap: onTap,
    ),
  );
}
