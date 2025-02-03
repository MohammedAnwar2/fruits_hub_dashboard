import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showEffectEventMessage(BuildContext context, String errorMessage,
        [Color backgroundColor = AppColors.primary,
        Color textColor = AppColors.white]) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        errorMessage,
        style: AppTextStyle.medium15.copyWith(color: textColor),
      ),
    ),
  );
}
