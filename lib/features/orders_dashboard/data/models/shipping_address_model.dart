import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? flatNumber;
  int? phoneNumber;
  ShippingAddressModel({
    this.email,
    this.name,
    this.flatNumber,
    this.address,
    this.city,
    this.phoneNumber,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      flatNumber: json['flatNumber'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'flatNumber': flatNumber,
      'phoneNumber': phoneNumber,
    };
  }

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      email: shippingAddressEntity.email,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      flatNumber: shippingAddressEntity.flatNumber,
      phoneNumber: shippingAddressEntity.phoneNumber,
    );
  }
  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      city: city,
      flatNumber: flatNumber,
      phoneNumber: phoneNumber,
    );
  }
}
