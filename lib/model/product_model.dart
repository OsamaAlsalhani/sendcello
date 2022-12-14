import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  late String name, description, productId, category, price, date;

  late List<String> imageSlider;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.productId,
    required this.category,
    required this.imageSlider,
  });

  ProductModel.fromJson(DocumentSnapshot snapshot) {
    name = snapshot['name'];
    description = snapshot['description'];
    price = snapshot['price'];
    productId = snapshot.id;
    category = snapshot['category'];
    date = snapshot['date'] as String;
    imageSlider = List<String>.from(snapshot['imageSlider']);
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'productId': productId,
      'category': category,
      'date': date,
      'imageSlider': imageSlider,
    };
  }
}
