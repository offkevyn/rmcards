import 'package:flutter/material.dart';

import '../../util/app/colors_app.dart';

class InputCustom extends StatelessWidget {
  final String placeholder;
  final ValueChanged<String> onChanged;
  final IconData? icon;
  final bool iconAtEnd;
  final TextEditingController? controller;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final Color? placeholderColor;

  const InputCustom({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.icon,
    this.iconAtEnd = false,
    this.controller,
    this.borderColor = ColorsApp.green4,
    this.textColor = ColorsApp.gray,
    this.backgroundColor = ColorsApp.green5,
    this.placeholderColor = ColorsApp.gray2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (icon != null && !iconAtEnd)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon, color: textColor, size: 28),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: borderColor,
              style: TextStyle(color: textColor, fontSize: 20),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: placeholderColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (icon != null && iconAtEnd)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(icon, color: borderColor, size: 28),
            ),
        ],
      ),
    );
  }
}
