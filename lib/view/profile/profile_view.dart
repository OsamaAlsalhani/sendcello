import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/view/auth/login_screen.dart';
import 'package:supercellostore/view/profile/edit_profile_view.dart';
import 'package:supercellostore/view/profile/notifications_view.dart';
import 'package:supercellostore/view/profile/order_history_view.dart';
import '../widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                const AssetImage('assets/images/cello.png'),
                            foregroundImage:
                                controller.currentUser!.pic != 'default'
                                    ? NetworkImage(controller.currentUser!.pic)
                                    : null,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.currentUser!.name,
                                fontSize: 26,
                              ),
                              const SizedBox(height: 6),
                              CustomText(
                                text: controller.currentUser!.email,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      CustomListTile(
                        icon: const Icon(Icons.edit),
                        title: 'Edit Profile',
                        onTapFn: () {
                          Get.to(() => const EditProfileView());
                        },
                      ),
                      CustomListTile(
                        icon: const Icon(Icons.history),
                        title: 'Order History',
                        onTapFn: () {
                          Get.to(() => OrderHistoryView());
                        },
                      ),
                      CustomListTile(
                        icon: const Icon(Icons.notifications),
                        title: 'Notifications',
                        onTapFn: () {
                          Get.to(() => const NotificationsView());
                        },
                      ),
                      CustomListTile(
                        icon: const Icon(Icons.logout),
                        title: 'Log Out',
                        onTapFn: () {
                          Get.find<AuthViewModel>().signOut();
                          leavetopics();
                          Get.offAll(LoginView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

leavetopics() async {
  await FirebaseMessaging.instance.unsubscribeFromTopic('Cello');
}

class CustomListTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onTapFn;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapFn,
          leading: icon,
          title: CustomText(
            text: title,
            fontSize: 18,
          ),
          trailing: title == 'Log Out'
              ? null
              : const Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
