import 'package:flutter/material.dart';

import '../../util/app/colors_app.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final bool iconAtEnd;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;

  const ButtonCustom({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.iconAtEnd = false,
    this.borderColor = ColorsApp.green2,
    this.textColor = ColorsApp.green2,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && !iconAtEnd) Icon(icon, color: textColor),
        if (icon != null && !iconAtEnd) const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (icon != null && iconAtEnd) const SizedBox(width: 8),
        if (icon != null && iconAtEnd) Icon(icon, color: textColor),
      ],
    );
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: child,
      ),
    );
  }
}
