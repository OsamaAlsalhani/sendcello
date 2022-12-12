import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselModel {
  late List<String> imageSlider;

  CarouselModel({required this.imageSlider});

  CarouselModel.fromJson(DocumentSnapshot snap) {
    imageSlider = List<String>.from(snap['imageSlider']);
  }

  toJson() {
    return {
      'imageSlider': imageSlider,
    };
  }
}
