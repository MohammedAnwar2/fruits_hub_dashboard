import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.value, required this.onChanged});
  final bool value;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 400),
        alignment: Alignment.center,
        // padding: EdgeInsets.all(4),
        width: 24,
        height: 24,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: !value ? AppColors.white : AppColors.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50,
                color: !value ? Color(0xFFDCDEDE) : AppColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: value ? Icon(Icons.check, color: AppColors.white) : null,
      ),
    );
  }
}
