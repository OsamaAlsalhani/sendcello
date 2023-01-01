// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/services/firestore_home.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/view/widgets/images_slider.dart';
import 'package:supercellostore/view/widgets/list_product.dart';
import 'package:supercellostore/view/button/rownews.dart';
import 'widgets/custom_text.dart';
import 'widgets/list_categories.dart';
import 'widgets/rowname.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel controller = Get.put(HomeViewModel());
  final FirestoreHome firestoreHome = FirestoreHome();
  List img = [];

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

  get _getCarouselFromFireStore async {
    var imageSlider = await firestoreHome.getCarouselImage;
    if (mounted) {
      setState(() {
        img = imageSlider!;
      });
    }
  }

  @override
  void initState() {
    jointopics();
    requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getCarouselFromFireStore;
    Get.put(CheckoutViewModel());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImagesSlider(
                carousel: img,
              ),
              const SizedBox(height: 19),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 60,
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    const number = ClipboardData(text: '+963944700444');
                    Clipboard.setData(number);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم النسخ الى الحافظة')),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(
                        text: 'للتواصل جملة',
                        alignment: Alignment.center,
                      ),
                      CustomText(
                        text: '+963944700444',
                        color: Colors.amber,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const RowNews(),
              const SizedBox(height: 25),
              ListViewCategories(),
              const SizedBox(height: 30),
              RowName(
                categoryName: 'New Form Cello',
                productCategoryName: 'new',
              ),
              const SizedBox(height: 30),
              ListViewProducts(
                product: controller.products
                    .where((product) => product.category == 'new')
                    .toList(),
              ),
              const SizedBox(height: 30),
              const Divider(),
              RowName(
                categoryName: 'Creep Digital',
                productCategoryName: 'كريب ديجيتال',
              ),
              const SizedBox(height: 30),
              ListViewProducts(
                  product: controller.products
                      .where((product) => product.category == 'كريب ديجيتال')
                      .toList()),
              const SizedBox(height: 30),
              RowName(
                categoryName: "Offers",
                productCategoryName: 'عروضات',
              ),
              const SizedBox(height: 30),
              ListViewProducts(
                  product: controller.products
                      .where((product) => product.category == 'عروضات')
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
