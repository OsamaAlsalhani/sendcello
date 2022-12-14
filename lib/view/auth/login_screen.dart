import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/view/auth/custom_button_social.dart';
import 'package:supercellostore/view/auth/register_screen.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: 16.w, left: 16.w, top: 75.h, bottom: 42.h),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: 'Welcome',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(RegisterView());
                                },
                                child: const CustomText(
                                  text: 'Sign Up',
                                  fontSize: 18,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomText(
                            text: 'Sign in to Continue',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 48.h,
                          ),
                          CustomTextFormField(
                            title: 'Email',
                            hintText: 'example@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email invalid or not found';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.email = value;
                            },
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          CustomTextFormField(
                            title: 'Password',
                            hintText: '***********',
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is incorrect';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.password = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomText(
                            text: 'Forgot Password?',
                            fontSize: 14,
                            alignment: Alignment.centerRight,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            text: 'SIGN IN',
                            color: primaryColor,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.signInWithEmailAndPassword();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                const CustomText(
                  text: '-OR-',
                  fontSize: 18,
                  alignment: Alignment.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 43.h,
                ),
                CustomButtonSocial(
                  title: 'Sign In with Facebook',
                  image: 'facebook',
                  onPressedFn: () {
                    controller.signInWithFacebookAccount();
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButtonSocial(
                  title: 'Sign In with Google',
                  image: 'google',
                  onPressedFn: () {
                    controller.signInWithGoogleAccount();
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
