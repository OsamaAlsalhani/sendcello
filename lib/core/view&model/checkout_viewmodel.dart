import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supercellostore/core/services/firestore_checkout.dart';
import 'package:supercellostore/model/checkout_model.dart';
import 'cart_viewmodel.dart';

class CheckoutViewModel extends GetxController {
  final FirestoreCheckout firestoreCheckout = FirestoreCheckout();
  String? name, phone;

  var checkouts = <CheckoutModel>[].obs;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    _getCheckoutsFromFireStore();
    super.onInit();
  }

  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    checkouts.bindStream(firestoreCheckout.getOrdersFromFirestore());
    _isLoading = false;
    update();
  }

  addCheckoutToFireStore() async {
    await FirestoreCheckout().addOrderToFirestore(CheckoutModel(
      id: '',
      products: Get.find<CartViewModel>().cartProducts,
      name: name!,
      phone: phone!,
      totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
    ));
    Get.find<CartViewModel>().removeAllProducts();
    Get.back();
    _getCheckoutsFromFireStore();
  }
}
