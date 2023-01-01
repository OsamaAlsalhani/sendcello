import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supercellostore/core/services/firestore_user.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/model/feedback.dart';

class FeedBackController extends GetxController {
  final FirestoreUser firestoreUser = FirestoreUser();
  var feedbacks = <FeedBackModel>[].obs;
  String? feedBackMes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    _getFeedBackFromFireStore();
    super.onInit();
  }

  _getFeedBackFromFireStore() async {
    _isLoading = true;
    feedbacks.bindStream(firestoreUser.getFeedBackFromFirestore());
    _isLoading = false;
    update();
  }

  sendFeedBack() async {
    await firestoreUser.addFeedBackToFirestore(
      FeedBackModel(
        userId: Get.find<ProfileViewModel>().currentUser!.userId,
        date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
        feedBackMes: feedBackMes!,
      ),
    );
    _getFeedBackFromFireStore();
  }
}
