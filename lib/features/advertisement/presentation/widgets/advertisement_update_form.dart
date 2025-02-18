import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/validate_input.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/utils/entity_provider.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_form_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/open_color_picker.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/update_advertisement_cubit/update_advertisement_cubit.dart';

class AdvertisementUpdateForm extends StatefulWidget {
  const AdvertisementUpdateForm({
    super.key,
  });

  @override
  State<AdvertisementUpdateForm> createState() =>
      _AdvertisementUpdateFormState();
}

class _AdvertisementUpdateFormState extends State<AdvertisementUpdateForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleEnglish = TextEditingController();
  TextEditingController titleArabic = TextEditingController();
  TextEditingController discount = TextEditingController();
  Color? backgroundBanner;
  File? imageFile;
  late AdvertisementEntity advertisement;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    advertisement = EntityProvider.read<AdvertisementEntity>(context)!;
    titleEnglish.text = advertisement.titleEnglish;
    titleArabic.text = advertisement.titleArabic;
    discount.text = advertisement.discount.toString();
    backgroundBanner = advertisement.backgroundBanner;
    imageFile = advertisement.imageFile;
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
                imageUrl: advertisement.imageUrl,
                onFilePicked: (image) {
                  imageFile = image;
                },
              ),
              CustomColorPicker(
                currentColor: backgroundBanner,
                onColorChanged: (Color value) {
                  backgroundBanner = value;
                },
              ),
              CustomButton(
                text: "Update",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await _buildUpdateAdvertisement();
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

  Future<void> _buildUpdateAdvertisement() async {
    AdvertisementEntity inputEntity = AdvertisementEntity(
      titleArabic: titleArabic.text,
      titleEnglish: titleEnglish.text,
      discount: num.parse(discount.text),
      backgroundBanner: backgroundBanner!,
      imageFile: imageFile,
      imageUrl: advertisement.imageUrl,
      pageRoute: '',
      id: advertisement.id,
    );
    if (inputEntity == advertisement) {
      Navigator.pop(context, false);
    } else {
      await context
          .read<UpdateAdvertisementCubit>()
          .updateAdvertisement(advertisementEntities: inputEntity);
    }
  }

  void showErrorMessage({required String errorMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
}
