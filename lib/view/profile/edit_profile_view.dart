// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/core/view&model/selectImage_viewmodel.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const CustomText(
                    text: 'Edit Profile',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(width: 24),
                ],
              ),
            ),
          ),
          GetBuilder<SelectImageViewModel>(
            init: SelectImageViewModel(),
            builder: (controller) => Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 24),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: loginMethod == 'google.com' ||
                              loginMethod == 'facebook.com'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  loginMethod == 'google.com'
                                      ? 'assets/icons/google.png'
                                      : 'assets/icons/facebook.png',
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                CustomText(
                                  text: loginMethod == 'google.com'
                                      ? 'You\'re logged in using Google account!'
                                      : 'You\'re logged in using Facebook account!',
                                  fontSize: 16,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage: const AssetImage(
                                            'assets/images/cello.png'),
                                        foregroundImage: controller.imageFile !=
                                                null
                                            ? FileImage(controller.imageFile!)
                                            : null,
                                      ),
                                      const SizedBox(width: 40),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: const CustomText(
                                                text: 'Choose option',
                                                fontSize: 20,
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Divider(
                                                    height: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .cameraImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: const CustomText(
                                                      text: 'Camera',
                                                    ),
                                                    leading: const Icon(
                                                      Icons.camera,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  const Divider(height: 1),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .galleryImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: const CustomText(
                                                        text: 'Gallery'),
                                                    leading: const Icon(
                                                      Icons.account_box,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: const CustomText(
                                            text: 'Select Image'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 38),
                                  CustomTextFormField(
                                    title: 'Name',
                                    hintText: Get.find<ProfileViewModel>()
                                        .currentUser!
                                        .name,
                                    initialValue: Get.find<ProfileViewModel>()
                                        .currentUser!
                                        .name,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4) {
                                        return 'Please enter valid name.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      Get.find<ProfileViewModel>().name = value;
                                    },
                                  ),
                                  const SizedBox(height: 38),
                                  Column(
                                    children: [
                                      CustomTextFormField(
                                        title: 'Email',
                                        hintText: Get.find<ProfileViewModel>()
                                            .currentUser!
                                            .email,
                                        initialValue:
                                            Get.find<ProfileViewModel>()
                                                .currentUser!
                                                .email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter valid email address.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          Get.find<ProfileViewModel>().email =
                                              value;
                                        },
                                      ),
                                      const SizedBox(height: 38),
                                      CustomTextFormField(
                                        title: 'Password',
                                        hintText: '',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 6) {
                                            return 'Please enter valid password with at least 6 characters.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          Get.find<ProfileViewModel>()
                                              .password = value;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50),
                                  _isLoading
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                          text: 'SUBMIT',
                                          color: primaryColor,
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              try {
                                                await controller
                                                    .uploadImageToFirebase();
                                                Get.find<ProfileViewModel>()
                                                    .picUrl = controller.picUrl;
                                              } catch (e) {
                                                Get.find<ProfileViewModel>()
                                                        .picUrl =
                                                    Get.find<ProfileViewModel>()
                                                        .currentUser!
                                                        .pic;
                                              }
                                              _formKey.currentState!.save();
                                              await Get.find<ProfileViewModel>()
                                                  .updateCurrentUser();
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            }
                                          },
                                        ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
