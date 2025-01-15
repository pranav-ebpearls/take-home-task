import 'package:flutter/material.dart';
import 'package:take_home_task/utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType textInputType;
  final double borderRadius;
  final Color borderColor;
  final Color hintColor;
  final double hintFontSize;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.borderRadius = 10,
    this.borderColor = AppColors.borderColor,
    this.hintColor = Colors.white,
    this.hintFontSize = 12,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final enabledBorderColor = borderColor;

    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: readOnly ? Colors.grey.shade600 : Colors.black,
          ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.accentColor,
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 16, color: AppColors.virtualLinkHintColor),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.accentColor,
        ),
        floatingLabelBehavior:
            FloatingLabelBehavior.never, // Disable floating label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: enabledBorderColor,
          ),
        ),
      ),
    );
  }
}
