import 'dart:convert';

import 'package:e_commerce/screen/login.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_images.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signUp-screen';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp(String name, email, password) async {
    print(password);
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "number": "",
      "pinCode": "",
      "address": "",
      "locality": "",
      "city": "",
      "state": "",
    });
    prefs.setString(email, userData);
    Prefrence().setEmail(emailController.text.toString());
    Prefrence().setLogin(true);
  }

  bool validateEmail(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

    // Create a RegExp object with the pattern
    final regex = RegExp(pattern);

    // Use the RegExp object's `hasMatch` method to check if the email matches the pattern
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode focusScopeNode = FocusScope.of(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Text(
                        AppText.signUp,
                        style: TextStyle(
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: TextField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.colorBlack,
                        decoration: const InputDecoration(
                          labelText: AppText.name,
                          labelStyle:
                              TextStyle(color: AppColors.colorGreyRobot),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.02,
                      ),
                      child: TextField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppColors.colorBlack,
                        decoration: const InputDecoration(
                          labelText: AppText.email,
                          labelStyle:
                              TextStyle(color: AppColors.colorGreyRobot),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: TextField(
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: AppColors.colorBlack,
                        decoration: const InputDecoration(
                          labelText: AppText.password,
                          labelStyle:
                              TextStyle(color: AppColors.colorGreyRobot),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorGreyRobot,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.width * 0.04, top: size.height * 0.01),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Login.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                AppText.alreadyHaveAccount,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt_rounded,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.02,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: AppColors.primaryColor,
                          minimumSize: Size(size.width, size.height * 0.06),
                        ),
                        onPressed: () {
                          focusScopeNode.unfocus();
                          if (nameController.text.isEmpty) {
                            ToastMessage()
                                .showToast("Please Enter Name", context, false);
                            return;
                          }
                          if (emailController.text.isEmpty) {
                            ToastMessage().showToast(
                                "Please Enter Email", context, false);
                            return;
                          }
                          if (!validateEmail(emailController.text.toString())) {
                            ToastMessage().showToast(
                                "Please Enter Valid Email", context, false);
                            return;
                          }
                          if (passwordController.text.isEmpty) {
                            ToastMessage().showToast(
                                "Please Enter Password", context, false);
                            return;
                          }
                          signUp(
                            nameController.text.toString(),
                            emailController.text.toString(),
                            passwordController.text.toString(),
                          );
                          Navigator.of(context).pushNamed(NavBar.routeName);
                        },
                        child: Text(AppText.signUp.toUpperCase()),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    const Text(
                      "Sign up with social account",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(17),
                            shape: const CircleBorder(),
                            backgroundColor: AppColors.colorGrey,
                          ),
                          onPressed: () {},
                          child: Image.asset(AppImages.google,
                              height: size.height * 0.03),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(17),
                            shape: const CircleBorder(),
                            backgroundColor: AppColors.colorGrey,
                          ),
                          onPressed: () {},
                          child: Image.asset(AppImages.facebook,
                              height: size.height * 0.03),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
