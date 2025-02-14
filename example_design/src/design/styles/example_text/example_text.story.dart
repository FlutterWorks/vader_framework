import 'package:flutter/material.dart';
import 'package:example_design/example_design.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

//region Knobs
String textKnob(BuildContext context) => context.knobs.text(label: 'Button text', initial: 'START!');

String textKnobOptions(BuildContext context) => context.knobs.options(
      label: 'Change text',
      initial: bodyText,
      options: [
        const Option(label: "Title text", value: "Vánoční party s Hanserem a Vilmou"),
        const Option(label: "Body text", value: bodyText),
        const Option(label: "Short text", value: "Zobrazit na mapě"),
        const Option(label: "Special characters text", value: "§1234567890-=±!@#\$%^&*()_+[]{}:\\\"|,./<>'?"),
      ],
    );

const bodyText = """
Srdečně vás zveme na komorní vánoční párty!
Přijďte si užít pohodový večer s Hanserem a Vilmou v příjemné atmosféře baru  Maracas.
Tato akce je nejen pro naše studenty z kurzů, ale i pro  všechny, kdo si chtějí s námi dát drink,
popovídat, zatančit a naladit  se na vánoční pohodu.
""";

onTap() => debugPrint("Test click.");
//endregion

_item(BuildContext context, TextType textType) {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text('${textType.name}: '),
        ),
        Container(color: Colors.black, height: 50, width: 1.5),
        SizedBox(
          width: 300,
          child: ExampleText(
            text: textKnobOptions(context),
            type: textType,
          ),
        ),
      ],
    ),
  );
}

textTitleStyleStory(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    children: [
      _item(context, TextType.title1),
      _item(context, TextType.title2),
      _item(context, TextType.title3),
    ],
  );
}

textBodyStyleStory(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    children: [
      _item(context, TextType.body1),
      _item(context, TextType.body2),
    ],
  );
}

textCaptionStyleStory(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    children: [
      _item(context, TextType.caption1),
      _item(context, TextType.caption2),
    ],
  );
}
