import 'package:get/get.dart';
import 'package:supercellostore/core/services/local_database_cart.dart';

import '../../model/cart_model.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProducts = [];

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    update();
  }

  addProduct(CartModel cartModel) async {
    bool isExist = false;
    for (var element in _cartProducts) {
      if (element.image == cartModel.image) {
        isExist = true;
      }
    }
    if (!isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();
    }
  }

  removeProduct(String image) async {
    await LocalDatabaseCart.db.deleteProduct(image);
    getCartProducts();
  }

  removeAllProducts() async {
    await LocalDatabaseCart.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    for (var cartProduct in _cartProducts) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    }
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    getTotalPrice();
    await LocalDatabaseCart.db.update(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index, String image) async {
    if (_cartProducts[index].quantity != 1) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    } else {
      removeProduct(image);
    }
  }
}
