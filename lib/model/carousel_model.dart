import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselModel {
  late String image;

  CarouselModel({required this.image});

  CarouselModel.fromJson(DocumentSnapshot snap) {
    image = snap['image'];
  }

  toJson() {
    return {
      'image': image,
    };
  }
}
