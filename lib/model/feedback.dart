import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackModel {
  late String userId;
  late String feedBackMes;
  late String date;

  FeedBackModel({
    required this.userId,
    required this.date,
    required this.feedBackMes,
  });

  FeedBackModel.fromJson(DocumentSnapshot snap) {
    userId = snap['userId'];
    date = snap['date'];
    feedBackMes = snap['feedBackMes'];
  }

  toJson() {
    return {
      'userId': userId,
      'date': date,
      'feedBackMes': feedBackMes,
    };
  }
}
