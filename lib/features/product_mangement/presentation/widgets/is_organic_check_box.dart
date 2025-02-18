import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged,  this.value=false});
  final Function(bool) onChanged;
  final bool value ;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {

  late bool organicValue;
  @override
  void initState() {
    organicValue = widget.value;
    super.initState();
  }
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