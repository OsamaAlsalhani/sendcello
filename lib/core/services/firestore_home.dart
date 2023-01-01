import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercellostore/model/category_model.dart';
import 'package:supercellostore/model/product_model.dart';

class FirestoreHome {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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

  Future<List?> get getCarouselImage async {
    try {
      final data = await _firebaseFirestore
          .collection('Carousel')
          .doc('haYnP3XEFL3TukVHPxby')
          .get();
      return data.data()!['imageSlider'];
    } catch (e) {
      return null;
    }
  }
}
