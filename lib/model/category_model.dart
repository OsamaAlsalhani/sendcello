import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  late String name;

  CategoryModel({required this.name});

  CategoryModel.fromJson(DocumentSnapshot snap) {
    name = snap['name'];
  }

  toJson() {
    return {
      'name': name,
    };
  }
}
