import 'package:flutter/material.dart';
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
              const EdgeInsets.only(right: 16, left: 16, top: 32, bottom: 44),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomText(
                          text: 'Sign Up',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 48),
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
                        const SizedBox(height: 38),
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
                        const SizedBox(height: 38),
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
                        const SizedBox(height: 60),
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
