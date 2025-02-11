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


testButtonStory(BuildContext context) {
  return TestButton(
    text: textKnobOptions(context),
    onTap: onTap,
    icon: Icons.add,
  );
}

createTestButtonStory(BuildContext context) {
  return const TestButton(
    text: "Vytvořit",
    onTap: onTap,
  );
}

iconTestButtonStory(BuildContext context) {
  return const TestButton(
    text: "Přidat",
    onTap: onTap,
    icon: Icons.add,
  );
}

customizedTestButtonStory(BuildContext context) {
  return TestButton(
    text: textKnobOptions(context),
    onTap: onTap,
    style: TestButtonStyle(
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

