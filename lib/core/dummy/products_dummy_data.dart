import 'dart:io';

import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

ProductEntities  productDummyData() {
  
  return  ProductEntities(
      productName: 'Apple',
      productPrice: 10.0,
      productCode: '1',
      productDescription: 'This is an apple', 
      isFeature: true,
      imageFile: File(''),
      expirationMonths: 12,
      isOrganic: true,
      avgRating: 4.5,
      ratingCount: 10,
      unitAmount: 100,
      numberOfCalories: 100,
      sellingCount: 10,
      imageUrl: 'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png'
    );
  
}

List<ProductEntities> get  productsListDummyData {
  return List.generate(30, (index) => productDummyData());
}