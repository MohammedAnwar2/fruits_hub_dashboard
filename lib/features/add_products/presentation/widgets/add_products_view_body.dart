import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/image_field.dart';

class AddProductsViewBody extends StatefulWidget {
  const AddProductsViewBody({super.key});

  @override
  State<AddProductsViewBody> createState() => _AddProductsViewBodyState();
}

class _AddProductsViewBodyState extends State<AddProductsViewBody> {
  GlobalKey formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontal),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                text: "Product Name",
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                text: "Product Price",
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                text: "Product code",
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                text: "Product Description",
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              ImageField(
                onFilePicked: (imageFile) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
