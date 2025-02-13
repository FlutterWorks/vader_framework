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

exampleButtonStory(BuildContext context) {
  return ExampleButton(
    text: textKnobOptions(context),
    onTap: onTap,
  );
}

createPrimaryLargeExampleButtonStory(BuildContext context) {
  return ExampleButton(
    text: "Vytvořit",
    onTap: onTap,
  );
}

iconPrimaryLargeExampleButtonStory(BuildContext context) {
  return ExampleButton(
    text: "Zúčastním se",
    onTap: onTap,
    leadingIcon: Icons.add,
  );
}

iconPrimarySmallExampleButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Sdílet",
    onTap: onTap,
    leadingIcon: Icons.add,
    size: ButtonSize.small,
  );
}

iconOutlinedLargeExampleButtonStory(BuildContext context) {
  return ExampleButton(
    text: "Zobrazit na mapě",
    onTap: onTap,
    leadingIcon: Icons.add,
    variant: ButtonVariant.outlined,
  );
}

iconOutlinedLargeErrorExampleButtonStory(BuildContext context) {
  return ExampleButton(
    text: "Zobrazit na mapě",
    onTap: onTap,
    leadingIcon: Icons.add,
    variant: ButtonVariant.outlined,
    indicator: ButtonIndicator.error,
  );
}

iconOutlinedSmallExampleButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Poslat zprávu",
    onTap: onTap,
    leadingIcon: Icons.add,
    size: ButtonSize.small,
  );
}

iconPrimaryMediumExampleButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Jít vyhledávat",
    onTap: onTap,
    leadingIcon: Icons.add,
    size: ButtonSize.medium,
  );
}

iconLeadingLinkMediumExampleButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Přidat událost",
    onTap: onTap,
    leadingIcon: Icons.add,
    size: ButtonSize.medium,
  );
}

iconTrailingLinkMediumExampleButtonStory(BuildContext context) {
  return const ExampleButton(
    text: "Detail",
    onTap: onTap,
    trailingIcon: Icons.add,
    size: ButtonSize.medium,
  );
}
