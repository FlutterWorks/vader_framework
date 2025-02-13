import 'package:flutter/material.dart';

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

class DesignTextStyles {
  static const TextStyle semiboldInter12Text = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const TextStyle boldInter12Text = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle semiboldInter16Text = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
