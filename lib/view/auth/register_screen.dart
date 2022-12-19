import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/auth_view_modle.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(right: 16.w, left: 16.w, top: 32.h, bottom: 44.h),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomText(
                          text: 'Sign Up',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        CustomTextFormField(
                          title: 'Name',
                          hintText: 'Enter Your Name',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid name.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.name = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        CustomTextFormField(
                          title: 'Email',
                          hintText: 'example@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter valid email address.';
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
                            if (value!.isEmpty || value.length < 6) {
                              return 'Please enter valid password with at least 6 characters.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.password = value;
                          },
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        CustomButton(
                          text: 'SIGN UP',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              controller.signUpWithEmailAndPassword();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
