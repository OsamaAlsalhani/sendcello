import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercellostore/model/cart_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckoutModel {
  late String name, phone, totalPrice, date, id, token, userId, locate;
  late List<CartModel> products;
  late bool isAccepted, isDelivered, isCancelled;

  CheckoutModel({
    required this.products,
    required this.name,
    required this.phone,
    required this.totalPrice,
    required this.date,
    required this.token,
    this.isAccepted = false,
    this.isCancelled = false,
    this.isDelivered = false,
    required this.userId,
    required this.id,
    required this.locate,
  });

  factory CheckoutModel.fromJson(DocumentSnapshot json) =>
      _$CheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);
}
