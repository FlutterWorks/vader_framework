import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class ImageButtonTheme {
  static final light = ImageButtonStyle(
    backgroundColor: Colors.blue,
    border: ShadBorder.all(
      width: 1,
      color: Colors.black.withAlpha(25),
    )
  );

  static final dark = ImageButtonStyle(
    backgroundColor: Colors.blue,
      border: ShadBorder.all(
        width: 1,
        color: Colors.black.withAlpha(25),
      )
  );
}