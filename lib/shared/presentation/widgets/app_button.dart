import 'package:flutter/material.dart';

import '../../constants/app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.onTap,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: AppText.small(
          text ?? 'Continue',
          color: textColor,
        ),
      ),
    );
  }
}
