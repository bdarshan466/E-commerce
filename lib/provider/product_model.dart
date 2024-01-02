import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String brand;
  final String imageUrl;
  final int quantity;
  final String size;
  final String realPrice;
  final String totalRP;
  final String fakePrice;
  final String totalFP;
  final String sale;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.imageUrl,
    required this.quantity,
    required this.size,
    required this.realPrice,
    required this.totalRP,
    required this.fakePrice,
    required this.totalFP,
    required this.sale,
  });
}
