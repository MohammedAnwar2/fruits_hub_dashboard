import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  final Function(File?) onFilePicked;
  const ImageField({
    super.key,
    required this.onFilePicked,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              try {
                await buildImagePicker();
                widget.onFilePicked(imageFile);
              } catch (e) {
                setState(() {
                  widget.onFilePicked(imageFile);
                  isLoading = false;
                });
              }
              setState(() {
                isLoading = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              width: double.infinity,
              child: imageFile == null
                  ? Icon(Icons.image_outlined, size: 250)
                  : ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius),
                      child: Image.file(imageFile!)),
            ),
          ),
          Visibility(
            visible: imageFile != null,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    imageFile = null;
                  });
                },
                icon:
                    Icon(Icons.delete_outline, color: AppColors.red, size: 30)),
          )
        ],
      ),
    );
  }

  Future<void> buildImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
  }
}
