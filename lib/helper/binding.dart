import 'package:get/get.dart';
import 'package:supercellostore/core/network_viewmodel.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/core/view&model/cart_viewmodel.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.put(CartViewModel());
    Get.lazyPut(() => NetworkViewModel());
  }
}
