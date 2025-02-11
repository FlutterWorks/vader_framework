import 'package:{{package.snakeCase()}}/{{package.snakeCase()}}.dart';
import 'package:flutter/material.dart';


class {{name.pascalCase()}}Theme {
  static final light = {{name.pascalCase()}}Style(
    color: DesignColors.blue.shade700,
    iconColor: DesignColors.white,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
      height: 0.5,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = {{name.pascalCase()}}Style(
    color: DesignColors.blue.shade500,
    iconColor: DesignColors.white,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
      height: 0.5,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}