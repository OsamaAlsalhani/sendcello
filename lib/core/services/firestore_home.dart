import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercellostore/model/carousel_model.dart';
import 'package:supercellostore/model/category_model.dart';

import 'package:supercellostore/model/product_model.dart';

class FirestoreHome {
  Stream<List<CategoryModel>> getCategories() => FirebaseFirestore.instance
      .collection('Categories')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => CategoryModel.fromJson(doc)).toList());

  Stream<List<ProductModel>> getProducts() => FirebaseFirestore.instance
      .collection('Products')
      .orderBy('date', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList());

  Stream<List<CarouselModel>> getCarousel() => FirebaseFirestore.instance
      .collection('Carousel')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => CarouselModel.fromJson(doc)).toList());
}
