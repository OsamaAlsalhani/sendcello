// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/model/product_model.dart';
import 'package:supercellostore/view/widgets/list_product.dart';
import 'category_products_view.dart';
import 'product_detail_view.dart';
import 'search_view.dart';
import 'widgets/custom_text.dart';
import 'widgets/list_categories.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel controller = Get.put(HomeViewModel());

  var fbm = FirebaseMessaging.instance;
  requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  jointopics() async {
    await FirebaseMessaging.instance.subscribeToTopic('Cello');
  }

  List<ProductModel> reversedList(List<ProductModel> list) {
    List<ProductModel> oldlist = list;
    List<ProductModel> newList = List.from(oldlist.reversed);
    return newList;
  }

  offappMessag() async {
    final HomeViewModel controller = Get.put(HomeViewModel());
    var message = await FirebaseMessaging.instance.getInitialMessage();
    List<ProductModel> productModel = controller.products
        .where((product) => product.name == message?.notification?.title)
        .toList();
    if (message != null) {
      ProductDetailView(productModel[0]);
    }
  }

  @override
  void initState() {
    offappMessag();
    requestPermission();
    jointopics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutViewModel());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          padding:
              EdgeInsets.only(top: 25.h, bottom: 14.h, right: 16.w, left: 16.w),
          child: Column(
            children: [
              Container(
                height: 49.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(45.r),
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Get.to(SearchView(value));
                  },
                ),
              ),
              SizedBox(height: 25.h),
              const CustomText(
                text: 'Categories',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              SizedBox(height: 19.h),
              //ImagesSlider(imagescar: controller.carousels.toList()[0]),
              SizedBox(height: 19.h),
              ListViewCategories(),
              SizedBox(height: 30.h),
              rowName(
                categoryName: 'New Form Cello',
                productCategoryName: 'new',
              ),
              SizedBox(height: 30.h),
              ListViewProducts(
                  product: reversedList(
                controller.products
                    .where((product) => product.category == 'new')
                    .toList(),
              )),
              SizedBox(height: 30.h),
              rowName(
                categoryName: 'Creep Digital',
                productCategoryName: 'كريب ديجيتال',
              ),
              SizedBox(height: 30.h),
              ListViewProducts(
                  product: reversedList(controller.products
                      .where((product) => product.category == 'كريب ديجيتال')
                      .toList())),
              SizedBox(height: 30.h),
              rowName(
                categoryName: "Offers",
                productCategoryName: 'عروضات',
              ),
              SizedBox(height: 30.h),
              ListViewProducts(
                  product: reversedList(controller.products
                      .where((product) => product.category == 'عروضات')
                      .toList())),
            ],
          ),
        ),
      ),
    );
  }
}

class rowName extends StatelessWidget {
  final String categoryName, productCategoryName;
  final HomeViewModel controller = Get.put(HomeViewModel());
  rowName({
    super.key,
    required this.categoryName,
    required this.productCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: categoryName,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => CategoryProductsView(
                categoryName: categoryName,
                products: controller.products
                    .where((product) => product.category == productCategoryName)
                    .toList()));
          },
          child: const CustomText(
            text: 'See all',
            fontSize: 16,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
