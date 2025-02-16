import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final Function(bool) onChanged;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool organicValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is organic item ?',
                style: AppTextStyle.semiBold13
                    .copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
          // textAlign: TextAlign.right,
        ),
        CustomCheckbox(
          value: organicValue,
          onChanged: (value) {
            setState(() {
              widget.onChanged(value);
              organicValue = value;
            });
          },
        )
      ],
    );
  }
}


        // Transform.translate(
        //   offset: Offset(8, 0),
        //   child: Checkbox(
        //     value: true,
        //     activeColor: AppColors.primary,
        //     onChanged: (value) {},
        //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   ),
        // ),