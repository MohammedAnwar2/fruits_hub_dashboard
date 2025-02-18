import 'package:flutter/material.dart';

class CustomLoadingAdvertisementImage extends StatelessWidget {
  const CustomLoadingAdvertisementImage({
    super.key,
    required this.isArabic,
  });

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 15,
      bottom: 15,
      left: isArabic ? 15 : width * .50,
      right: isArabic ? width * .50 : 15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 50,
          width: 50,
        
          color: Colors.red,
        ),
      ),
    );
  }
}