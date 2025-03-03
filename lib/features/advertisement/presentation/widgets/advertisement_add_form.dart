import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/validate_input.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_form_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/open_color_picker.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:uuid/uuid.dart';

class AdvertisementAddForm extends StatefulWidget {
  const AdvertisementAddForm({
    super.key,
  });

  @override
  State<AdvertisementAddForm> createState() =>
      _AdvertisementAddFormState();
}

class _AdvertisementAddFormState extends State<AdvertisementAddForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleEnglish = TextEditingController();
  TextEditingController titleArabic = TextEditingController();
  TextEditingController discount = TextEditingController();
  Color? backgroundBanner;
  File? imageFile;

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
                controller: titleArabic,
                text: "Title Arabic",
                validator: (value) {
                  return validateInput(value, 'title arabic is required');
                },
              ),
              CustomTextFormField(
                  controller: titleEnglish,
                  text: "title English",
                  validator: (value) {
                    return validateInput(value, 'title english is required');
                  }),
              CustomTextFormField(
                  controller: discount,
                  text: "Discount",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validateInput(value, 'discount is required');
                  }),
              ImageField(
                onFilePicked: (image) {
                  imageFile = image;
                },
              ),
              CustomColorPicker(
                onColorChanged: (Color value) {
                  backgroundBanner = value;
                },
              ),

              CustomButton(
                text: "Add",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (imageFile == null) {
                      showErrorMessage(errorMessage: 'image is required');
                    } else if (backgroundBanner == null) {
                      showErrorMessage(
                          errorMessage: 'background banner is required');
                    } else {
                      AdvertisementEntity inputEntity = AdvertisementEntity(
                        titleArabic: titleArabic.text,
                        titleEnglish: titleEnglish.text,
                        discount: num.parse(discount.text),
                        backgroundBanner: backgroundBanner!,
                        imageFile: imageFile!,
                        pageRoute: '',
                        id: getIt<Uuid>().v4(),
                      );

                      await context.read<AddAdvertisementCubit>().addAdvertisement(advertisementEntities: inputEntity);
                      // await context
                      //     .read<AddProductsCubit>()
                      //     .addProduct(addProductEntities: inputEntity);
                      // Navigator.pushReplacementNamed(context,GetProductsView.routeName);
                    }
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

  void showErrorMessage({required String errorMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
}
