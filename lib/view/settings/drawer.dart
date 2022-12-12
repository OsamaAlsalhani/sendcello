import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/view/profile/profile_view.dart';
import 'package:supercellostore/view/settings/settings.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          padding: EdgeInsets.symmetric(vertical: 25.h),
                          height: 250.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundImage:
                                    const AssetImage('assets/images/cello.png'),
                                foregroundImage: controller.currentUser!.pic !=
                                        'default'
                                    ? NetworkImage(controller.currentUser!.pic)
                                    : null,
                              ),
                              SizedBox(height: 12.h),
                              CustomText(
                                text: 'Name : ${controller.currentUser!.name}',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                alignment: Alignment.center,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text:
                                    'Email : ${controller.currentUser!.email}',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                            title: const Text('My Profile'),
                            onTap: () {
                              Get.to(const ProfileView());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: const Text('Settings'),
                            onTap: () {
                              Get.to(const SettingsView());
                            },
                          ),
                          const Divider(
                            color: primaryColor,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: const Icon(Icons.info),
                            title: const Text('Info'),
                            onTap: () {},
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
