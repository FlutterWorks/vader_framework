import 'package:example_design/constants/colors.dart';
import 'package:example_design/design/buttons/example_button/example_button.dart';
import 'package:example_design/design/buttons/example_button/example_button.style.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';
import 'package:vader/design_utils/path_builder.dart';

import '../../storybook.dart';

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

final buttonStories = [
  Story(
    tags: const ['buttons'],
    name: 'Default',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (context) => ExampleButton(
      text: textKnobOptions(context),
      onTap: onTap,
    ),
  ),
  Story(
    tags: const ['buttons'],
    name: 'ExampleButton',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (context) => const ExampleButton(
      text: "Vytvořit",
      onTap: onTap,
    ),
  ),
  Story(
    tags: const ['buttons'],
    name: 'Customized',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (context) => ExampleButton(
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
    ),
  ),
];

void main() => runApp(storybook(buttonStories));
