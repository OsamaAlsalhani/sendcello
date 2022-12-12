// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/checkout_model.dart';

class FirestoreCheckout {
  final CollectionReference _ordersCollection =
      FirebaseFirestore.instance.collection('Orders');

  Stream<List<CheckoutModel>> getOrdersFromFirestore() {
    return _ordersCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => CheckoutModel.fromJson(doc)).toList();
    });
  }

  addOrderToFirestore(CheckoutModel checkoutModel) async {
    await _ordersCollection.doc().set(checkoutModel.toJson());
  }
}
