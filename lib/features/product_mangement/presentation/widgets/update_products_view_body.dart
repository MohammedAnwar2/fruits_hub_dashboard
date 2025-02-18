import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/validate_input.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/utils/entity_provider.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_form_field.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/update_products_cubit/update_products_cubit.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/is_feature_check_box.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/is_organic_check_box.dart';

class UpdateProductsViewBody extends StatefulWidget {
  const UpdateProductsViewBody({super.key});

  @override
  State<UpdateProductsViewBody> createState() => _UpdateProductsViewBodyState();
}

class _UpdateProductsViewBodyState extends State<UpdateProductsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // TextEditingController codeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController unitAmountController = TextEditingController();
  TextEditingController expirationMonthsController = TextEditingController();
  TextEditingController numberOfColoriesController = TextEditingController();
  bool isFeature = false;
  bool isOrganic = false;
  File? imageFile;

  late ProductEntities productEntities;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productEntities = EntityProvider.read<ProductEntities>(context)!;
    nameController.text = productEntities.productName;
    priceController.text = productEntities.productPrice.toString();
    descriptionController.text = productEntities.productDescription;
    unitAmountController.text = productEntities.unitAmount.toString();
    expirationMonthsController.text =
        productEntities.expirationMonths.toString();
    numberOfColoriesController.text =
        productEntities.numberOfCalories.toString();
    isFeature = productEntities.isFeature;
    isOrganic = productEntities.isOrganic;
    imageFile = productEntities.imageFile;
  }

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
                controller: nameController,
                text: "Product Name",
                keyboardType: TextInputType.text,
                validator: (value) {
                  return validateInput(value, 'product name is required');
                },
              ),
              CustomTextFormField(
                  controller: priceController,
                  text: "Product Price",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validateInput(value, 'product price is required');
                  }),
              // CustomTextFormField(
              //   controller: codeController,
              //   text: "Product code",
              //   keyboardType: TextInputType.text,
              //   validator: (value) {
              //     return validateInput(value, 'product code is required');
              //   },
              // ),
              CustomTextFormField(
                controller: expirationMonthsController,
                text: "Expiration Months",
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateInput(value, 'expiration months is required');
                },
              ),
              CustomTextFormField(
                controller: unitAmountController,
                text: "Unit Amount",
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateInput(value, 'unit amount is required');
                },
              ),
              CustomTextFormField(
                controller: numberOfColoriesController,
                text: "Number Of Colories",
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validateInput(value, 'number of colories is required');
                },
              ),
              CustomTextFormField(
                controller: descriptionController,
                text: "Product Description",
                keyboardType: TextInputType.text,
                maxLines: 5,
                validator: (value) {
                  return validateInput(
                      value, 'product description is required');
                },
              ),
              IsOrganicCheckBox(
                value: isOrganic,
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              IsfeatureCheckBox(
                value: isFeature,
                onChanged: (value) {
                  isFeature = value;
                },
              ),
              ImageField(
                imageUrl: productEntities.imageUrl,
                onFilePicked: (image) {
                  imageFile = image;
                },
              ),
              CustomButton(
                text: "Update Product",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await _buildUpdateProduct(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _buildUpdateProduct(BuildContext context) async {
    ProductEntities inputEntity = ProductEntities(
      productName: nameController.text,
      productPrice: num.parse(priceController.text),
      productCode: productEntities.productCode,
      productDescription: descriptionController.text,
      imageFile: imageFile,
      isFeature: isFeature,
      expirationMonths: int.parse(expirationMonthsController.text),
      unitAmount: int.parse(unitAmountController.text),
      numberOfCalories: int.parse(numberOfColoriesController.text),
      isOrganic: isOrganic,
      imageUrl: productEntities.imageUrl,
      avgRating: productEntities.avgRating,
      ratingCount: productEntities.ratingCount,
      sellingCount: productEntities.sellingCount,
    );
    if (inputEntity == productEntities) {
      Navigator.pop(context, false);
    } else {
      await context
          .read<UpdateProductsCubit>()
          .updateProduct(productEntities: inputEntity);
    }
  }

  void showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please select image"),
      ),
    );
  }
}
