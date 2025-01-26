// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'buttons.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ButtonsStyleTailorMixin on ThemeExtension<ButtonsStyle> {
  SimpleButtonStyle get simpleButtonStyle;
  ExampleButtonStyle get exampleButtonStyle;

  @override
  ButtonsStyle copyWith({
    SimpleButtonStyle? simpleButtonStyle,
    ExampleButtonStyle? exampleButtonStyle,
  }) {
    return ButtonsStyle(
      simpleButtonStyle: simpleButtonStyle ?? this.simpleButtonStyle,
      exampleButtonStyle: exampleButtonStyle ?? this.exampleButtonStyle,
    );
  }

  @override
  ButtonsStyle lerp(covariant ThemeExtension<ButtonsStyle>? other, double t) {
    if (other is! ButtonsStyle) return this as ButtonsStyle;
    return ButtonsStyle(
      simpleButtonStyle: simpleButtonStyle.lerp(other.simpleButtonStyle, t)
          as SimpleButtonStyle,
      exampleButtonStyle: exampleButtonStyle.lerp(other.exampleButtonStyle, t)
          as ExampleButtonStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ButtonsStyle &&
            const DeepCollectionEquality()
                .equals(simpleButtonStyle, other.simpleButtonStyle) &&
            const DeepCollectionEquality()
                .equals(exampleButtonStyle, other.exampleButtonStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(simpleButtonStyle),
      const DeepCollectionEquality().hash(exampleButtonStyle),
    );
  }
}

extension ButtonsStyleBuildContextProps on BuildContext {
  ButtonsStyle get buttonsStyle => Theme.of(this).extension<ButtonsStyle>()!;
  SimpleButtonStyle get simpleButtonStyle => buttonsStyle.simpleButtonStyle;
  ExampleButtonStyle get exampleButtonStyle => buttonsStyle.exampleButtonStyle;
}
