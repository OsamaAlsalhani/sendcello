// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<dynamic, dynamic> json) => CartModel(
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int? ?? 1,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'productId': instance.productId,
      'price': instance.price,
      'quantity': instance.quantity,
    };
