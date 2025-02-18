import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  final Function(File?) onFilePicked;
  final String ?imageUrl;
  const ImageField({
    super.key,
    required this.onFilePicked,
    this.imageUrl,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  String? imageUrl;
  @override
  void initState() {
    imageUrl = widget.imageUrl;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              if(imageFile == null&& imageUrl == null){
                await changeImage();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              width: double.infinity,
              child: imageFile == null
                  ? imageUrl == null
                      ? Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: AppColors.primary,
                        )
                      : Image.network(imageUrl!)
                  : Image.file(imageFile!),
            ),
          ),
        if (imageFile == null&& imageUrl != null) 
            Visibility(
              visible: imageFile == null,
              child: IconButton(
                  onPressed: () async{
                    await changeImage();
                  },
                  icon: Icon(Icons.change_circle_outlined, color: AppColors.red, size: 30)),
            ),
         if (imageFile != null) 
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      imageFile = null;
                      widget.onFilePicked(imageFile);
                    });
                  },
                  icon: Icon(Icons.delete_outline, color: AppColors.red, size: 30)),
            )
        ],
      ),
    );
  }

  Future<void> changeImage() async {
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
  }

  Future<void> buildImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
  }
}
