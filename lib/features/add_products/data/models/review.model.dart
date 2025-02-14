import 'package:fruits_hub_dashboard/features/add_products/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDesription;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.date,
      required this.reviewDesription});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDesription': reviewDesription
    };
  }

  factory ReviewModel.fromEntity(ReviewEntity addProducts) {
    return ReviewModel(
        name: addProducts.name,
        image: addProducts.image,
        ratting: addProducts.ratting,
        date: addProducts.date,
        reviewDesription: addProducts.reviewDesription);
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        ratting: json['ratting'],
        date: json['date'],
        reviewDesription: json['reviewDesription']);
  }
}
