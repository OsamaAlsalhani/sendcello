// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/view/profile/profile_view.dart';
import 'package:supercellostore/view/settings/info.dart';
import 'package:supercellostore/view/settings/settings.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Drawer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Material(
                      color: primaryColor,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    const AssetImage('assets/images/cello.png'),
                                foregroundImage: controller.currentUser!.pic !=
                                        'default'
                                    ? NetworkImage(controller.currentUser!.pic)
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              CustomText(
                                text: 'Name : ${controller.currentUser!.name}',
                                fontWeight: FontWeight.bold,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(height: 8),
                              loginMethod == 'google.com' ||
                                      loginMethod == 'facebook.com'
                                  ? CustomText(
                                      text: loginMethod == 'google.com'
                                          ? 'Google account'
                                          : 'Facebook account',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      alignment: Alignment.center,
                                    )
                                  : CustomText(
                                      text:
                                          'Email : ${controller.currentUser!.email}',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      alignment: Alignment.center,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Wrap(
                        runSpacing: 8, //vertical space
                        children: [
                          ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: const CustomText(text: 'My Profile'),
                            onTap: () {
                              Get.to(() => const ProfileView());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: const CustomText(text: 'Settings'),
                            onTap: () {
                              Get.to(() => const SettingsView());
                            },
                          ),
                          const Divider(
                            color: primaryColor,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: const Icon(Icons.info),
                            title: const CustomText(text: 'Info'),
                            onTap: () {
                              Get.to(() => InfoView());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
