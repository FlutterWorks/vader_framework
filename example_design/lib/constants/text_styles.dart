import 'package:flutter/material.dart';
import 'package:example_design/constants/colors.dart';

///
/// Here will be the most common text styles.
/// For customization can be used copyWith.
///
/// For example:
/// TextStyle customStyle = TextStyles.largeBoldText.copyWith(
///   color: Colors.red,
///   decoration: TextDecoration.underline,
/// );
///

class ExampleTextStyles {
  static const TextStyle semiboldInterText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

class TextStyles {
  static const TextStyle extraLargeBoldText = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: DesignColors.black,
  );

  static const TextStyle extraLargeNormalText = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: DesignColors.black,
  );

  static const TextStyle extraLargeLightText = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w100,
    color: DesignColors.black,
  );

  static const TextStyle largeBoldText = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: DesignColors.black,
  );

  static const TextStyle largeNormalText = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: DesignColors.black,
  );

  static const TextStyle largeLightText = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w100,
    color: DesignColors.black,
  );

  static const TextStyle mediumBoldText = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: DesignColors.black,
  );

  static const TextStyle mediumNormalText = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: DesignColors.black,
  );

  static const TextStyle mediumLightText = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w100,
    color: DesignColors.black,
  );

  static const TextStyle smallBoldText = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: DesignColors.black,
  );

  static const TextStyle smallNormalText = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: DesignColors.black,
  );

  static const TextStyle smallLightText = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w100,
    color: DesignColors.black,
  );

  static const TextStyle tinyBoldText = TextStyle(
    fontSize: 8,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: DesignColors.black,
  );

  static const TextStyle tinyNormalText = TextStyle(
    fontSize: 8,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: DesignColors.black,
  );

  static const TextStyle tinyLightText = TextStyle(
    fontSize: 8,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w100,
    color: DesignColors.black,
  );
}
