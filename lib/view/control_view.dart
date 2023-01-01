import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/core/view&model/control_view_model.dart';
import 'package:supercellostore/view/auth/login_screen.dart';
import 'package:supercellostore/view/settings/drawer.dart';
import 'package:supercellostore/view/widgets/custom_bottom_navigation_bar.dart';
import '../core/network_viewmodel.dart';
import 'search_view.dart';
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
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              Get.to(const SearchView(''));
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

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 30),
            CustomText(
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
