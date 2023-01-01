import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercellostore/model/feedback.dart';

import '../../model/user_model.dart';

class FirestoreUser {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference _feedbackCollection =
      FirebaseFirestore.instance.collection('FeedBack');

  addUserToFirestore(UserModel userModel) async {
    await _usersCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Stream<List<FeedBackModel>> getFeedBackFromFirestore() {
    return _feedbackCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => FeedBackModel.fromJson(doc)).toList();
    });
  }

  addFeedBackToFirestore(FeedBackModel feedbackModel) async {
    await _feedbackCollection.doc().set(feedbackModel.toJson());
  }

  Future<DocumentSnapshot> getUserFromFirestore(String uid) async {
    return await _usersCollection.doc(uid).get();
  }
}
