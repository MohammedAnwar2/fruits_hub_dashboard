import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruits_hub_dashboard/core/utils/extentions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.text,
    this.controller,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
  });
  final String? text;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.primaryLight.withCustomOpacity(0.4),
        focusedBorder: boardMethod(),
        enabledBorder: boardMethod(),
        labelText: text,
        hintStyle: AppTextStyle.bold13.copyWith(color: AppColors.white),
        labelStyle: AppTextStyle.bold13.copyWith(color: AppColors.white),
        border: boardMethod(),
      ),
    );
  }

  OutlineInputBorder boardMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
