import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/core/view&model/control_view_model.dart';
import 'package:supercellostore/view/auth/login_screen.dart';
import 'package:supercellostore/view/profile/profile_view.dart';
import 'package:supercellostore/view/settings/drawer.dart';
import '../core/network_viewmodel.dart';
import 'widgets/custom_text.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginView()
          : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
                  Get.find<NetworkViewModel>().connectionStatus.value == 2
              ? GetBuilder<ControlViewModel>(
                  init: ControlViewModel(),
                  builder: (controller) => Scaffold(
                    drawer: const DrawerNav(),
                    appBar: AppBar(
                      title: const CustomText(
                        text: 'Cello Store',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        alignment: Alignment.center,
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: IconButton(
                            icon: const Icon(Icons.account_circle),
                            onPressed: () {
                              Get.to(() => const ProfileView());
                            },
                          ),
                        ),
                      ],
                    ),
                    body: controller.currentScreen,
                    bottomNavigationBar: const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: CustomBottomNavigationBar()),
                  ),
                )
              : const NoInternetConnection();
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: GetBuilder<ControlViewModel>(
        builder: (controller) => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
              activeIcon: CustomText(
                text: 'Home',
                fontSize: 14,
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.workspace_premium),
              activeIcon: CustomText(
                text: 'Customer',
                fontSize: 14,
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.shopping_cart),
              activeIcon: CustomText(
                text: 'Cart',
                fontSize: 14,
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            const CustomText(
              text: 'Please check your internet connection..',
              fontSize: 14,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
