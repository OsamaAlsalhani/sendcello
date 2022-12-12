import 'package:get/get.dart';
import 'package:supercellostore/model/carousel_model.dart';
import 'package:supercellostore/model/product_model.dart';
import '../services/firestore_home.dart';
import '../../model/category_model.dart';

class HomeViewModel extends GetxController {
  final FirestoreHome firestoreHome = FirestoreHome();
  var categories = <CategoryModel>[].obs;
  var products = <ProductModel>[].obs;
  var carousels = <CarouselModel>[].obs;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    _getCategoriesFromFireStore();
    _getProductsFromFireStore();
    _getCarouselFromFireStore();
    super.onInit();
  }

  _getCategoriesFromFireStore() async {
    _loading = true;
    categories.bindStream(firestoreHome.getCategories());
    _loading = false;
    update();
  }

  _getProductsFromFireStore() async {
    _loading = true;
    products.bindStream(firestoreHome.getProducts());
    _loading = false;
    update();
  }

  _getCarouselFromFireStore() async {
    _loading = true;
    carousels.bindStream(firestoreHome.getCarousel());
    _loading = false;
    update();
  }
}
