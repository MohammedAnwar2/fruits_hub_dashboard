import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/custom_check_box.dart';

class IsfeatureCheckBox extends StatefulWidget {
  const IsfeatureCheckBox({super.key, required this.onChanged,  this.value=false});
  final Function(bool) onChanged;
  final bool value ;
  @override
  State<IsfeatureCheckBox> createState() => _IsfeatureCheckBoxState();
}

class _IsfeatureCheckBoxState extends State<IsfeatureCheckBox> {
  bool termsValue = false;
  @override
  void initState() {
    termsValue = widget.value;
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
                text: 'is feature item ?',
                style: AppTextStyle.semiBold13
                    .copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
          // textAlign: TextAlign.right,
        ),
        CustomCheckbox(
          value: termsValue,
          onChanged: (value) {
            setState(() {
              widget.onChanged(value);
              termsValue = value;
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