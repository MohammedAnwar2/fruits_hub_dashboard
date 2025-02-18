import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdvertisementEntity extends Equatable {
  final String id;
  String? imageUrl;
  File? imageFile;
  final String titleEnglish;
  final String titleArabic;
  final num discount;
  final Color backgroundBanner;
  final String pageRoute;

  AdvertisementEntity({
    required this.id,
    this.imageUrl,
    required this.imageFile,
    required this.titleEnglish,
    required this.titleArabic,
    required this.discount,
    required this.backgroundBanner,
    required this.pageRoute,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        imageFile,
        titleEnglish,
        titleArabic,
        discount,
        backgroundBanner,
        pageRoute
      ];
}
