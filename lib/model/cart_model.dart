import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  late String name, image, productId, price;
  late int quantity;

  CartModel({
    required this.name,
    required this.image,
    required this.price,
    required this.productId,
    this.quantity = 1,
  });

  factory CartModel.fromJson(Map<dynamic, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
