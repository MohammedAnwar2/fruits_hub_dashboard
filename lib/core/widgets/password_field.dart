import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.password});
  final TextEditingController password;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.password,
      validator: (p0) => p0!.isEmpty ? 'الرجاء ادخال كلمة المرور' : null,
      text: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(obscureText ? Icons.visibility_off : Icons.remove_red_eye,
            color: obscureText ? AppColors.grayLight : AppColors.primary),
      ),
    );
  }
}
