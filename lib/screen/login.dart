import 'dart:convert';

import 'package:e_commerce/screen/forgot_password.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_images.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const routeName = '/login-screen';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateEmail(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

    // Create a RegExp object with the pattern
    final regex = RegExp(pattern);

    // Use the RegExp object's `hasMatch` method to check if the email matches the pattern
    return regex.hasMatch(email);
  }

  Future<void> login(String email, password) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(email)) {
      ToastMessage().showToast("User Not Found", context, false);
      return;
    }
    Map<String, dynamic> extractedUserData =
        json.decode(prefs.getString(email)!);
    if (email != extractedUserData["email"]) {
      ToastMessage().showToast("User Not Found", context, false);
      return;
    }
    if (password != extractedUserData["password"]) {
      ToastMessage().showToast("Wrong Password!", context, false);
      return;
    }
    if (email == extractedUserData["email"] &&
        password == extractedUserData["password"]) {
      Prefrence().setEmail(email);
      Navigator.of(context).pushNamed(NavBar.routeName);
    }
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
        appBar: AppBar(
          backgroundColor: AppColors.colorTransparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.colorBlack,
            ),
          ),
        ),
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
                        AppText.login,
                        style: TextStyle(
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
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
                          labelStyle: TextStyle(color: AppColors.colorGreyRobot),
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
                          labelStyle: TextStyle(color: AppColors.colorGreyRobot),
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
                            Navigator.of(context)
                                .pushNamed(ForgotPassword.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                AppText.forgotPassword,
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
                          if (emailController.text.isEmpty) {
                            ToastMessage()
                                .showToast("Please Enter Email", context, false);
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
                          login(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                          );
                        },
                        child: Text(AppText.login.toUpperCase()),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    const Text(
                      "Login with social account",
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
