import 'package:get/get.dart';
import 'package:supercellostore/core/network_viewmodel.dart';
import 'package:supercellostore/core/services/local_storage_user.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/core/view&model/cart_viewmodel.dart';
import 'package:supercellostore/core/view&model/feedback_viewmodel.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => NetworkViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.put(ProfileViewModel());
    Get.put(NetworkViewModel());
    Get.put(FeedBackController());
    Get.put(CartViewModel());
  }
}
