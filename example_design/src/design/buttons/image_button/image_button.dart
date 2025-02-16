import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'image_button.style.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.child,
    this.size = const Size(40, 40),
    this.onlyIcon = false,
    this.onTap,
    this.style,
  });

  final Widget child;
  final Size size;
  final bool onlyIcon;
  final GestureTapCallback? onTap;
  final ImageButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return ShadButton.ghost(
      onPressed: onTap,
      width: size.width,
      height: size.height,
      icon: child,
      decoration: !onlyIcon
          ? ShadDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: ShadBorder.all(
                width: 1,
                color: Colors.black.withAlpha(25),
              ),
            )
          : null,
    );
  }
}
