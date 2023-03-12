// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutModel _$CheckoutModelFromJson(DocumentSnapshot json) => CheckoutModel(
    products: (json['products'] as List<dynamic>)
        .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String,
    phone: json['phone'] as String,
    totalPrice: json['totalPrice'] as String,
    token: json['token'],
    date: json['date'] as String,
    isAccepted: json['isAccepted'] as bool? ?? false,
    isCancelled: json['isCancelled'] as bool? ?? false,
    isDelivered: json['isDelivered'] as bool? ?? false,
    id: json['id'] as String,
    locate: json['locate'] as String,
    userId: json['userId']);

Map<String, dynamic> _$CheckoutModelToJson(CheckoutModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'totalPrice': instance.totalPrice,
      'date': instance.date,
      'token': instance.token,
      'id': instance.id,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'isAccepted': instance.isAccepted,
      'isDelivered': instance.isDelivered,
      'isCancelled': instance.isCancelled,
      'userId': instance.userId,
      'locate': instance.locate,
    };
