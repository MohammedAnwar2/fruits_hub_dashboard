import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/product_order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  return OrderEntity(
    orderid: "ORD123456",
    uid: "ORD123456",
    totalPrice: 150.75,
    payWithCash: true,
    status: 4,
    timeline: [DateTime.now().toIso8601String()],
    orderDate: DateTime.now(),
    productOrderEntity: [
      ProductOrderEntity(
        productName: "Wireless Headphones",
        productPrice: 50.25,
        productCode: "WH-001",
        imageUrl:
            "https://img.freepik.com/free-psd/cineraria-flower-png-isolated-transparent-background_191095-10910.jpg",
        quantity: 2,
      ),
      ProductOrderEntity(
        productName: "Smart Watch",
        productPrice: 75.50,
        productCode: "SW-002",
        imageUrl:
            "https://img.freepik.com/free-psd/cineraria-flower-png-isolated-transparent-background_191095-10910.jpg",
        quantity: 1,
      ),
    ],
    shippingAddressEntity: ShippingAddressEntity(
      name: "John Doe",
      email: "johndoe@example.com",
      address: "123 Main Street",
      city: "New York",
      flatNumber: "5B",
      phoneNumber: 1234567890,
    ),
  );
}

List<OrderEntity> getDummyOrders() {
  return List.generate(10, (index) => getDummyOrder());
}