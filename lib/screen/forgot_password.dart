import 'dart:convert';

import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/forgot-password-screen';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  String password = "";
  String emailId = "";
  String name = "";
  String number = "";
  String pinCode = "";
  String address = "";
  String locality = "";
  String city = "";
  String state = "";

  bool validateEmail(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

    // Create a RegExp object with the pattern
    final regex = RegExp(pattern);

    // Use the RegExp object's `hasMatch` method to check if the email matches the pattern
    return regex.hasMatch(email);
  }

  Future<void> userInfo(String email) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(email)) {
      ToastMessage().showToast('User not found!', context, false);
      return;
    }
    Map<String, dynamic> extractedUserData =
        json.decode(prefs.getString(email)!);
    setState(() {
      name = extractedUserData["name"];
      number = extractedUserData["number"];
      emailId = extractedUserData["email"];
      password = extractedUserData["password"];
      if (extractedUserData["pinCode"] != "" &&
          extractedUserData["address"] != "" &&
          extractedUserData["locality"] != "" &&
          extractedUserData["city"] != "" &&
          extractedUserData["state"] != "") {
        pinCode = extractedUserData["pinCode"];
        address = extractedUserData["address"];
        locality = extractedUserData["locality"];
        city = extractedUserData["city"];
        state = extractedUserData["state"];
      }
    });
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
                      AppText.fPassword,
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                    padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      bottom: size.height * 0.02,
                    ),
                    child: TextField(
                      controller: oldPasswordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: AppColors.colorBlack,
                      decoration: const InputDecoration(
                        labelText: "Old Password",
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
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      bottom: size.height * 0.02,
                    ),
                    child: TextField(
                      controller: newPasswordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: AppColors.colorBlack,
                      decoration: const InputDecoration(
                        labelText: "New Password",
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
                      onPressed: () async {
                        userInfo(emailController.text.toString());
                        focusScopeNode.unfocus();
                        if (emailController.text.toString().isEmpty) {
                          ToastMessage()
                              .showToast("Please enter Email!", context, false);
                          return;
                        }
                        if (!validateEmail(emailController.text.toString())) {
                          ToastMessage().showToast(
                              "Please enter valid Email!", context, false);
                          return;
                        }
                        if (oldPasswordController.text.toString() != password) {
                          ToastMessage().showToast(
                              "Incorrect old password.", context, false);
                          return;
                        }
                        if (oldPasswordController.text.toString().isEmpty) {
                          ToastMessage().showToast(
                              "Please enter old Password!", context, false);
                          return;
                        }
                        if (oldPasswordController.text.toString() == password) {
                          if (newPasswordController.text.toString().isEmpty) {
                            ToastMessage().showToast(
                                "Please enter new Password", context, false);
                            return;
                          } else {
                            final prefs = await SharedPreferences.getInstance();
                            final userData = json.encode({
                              "name": name,
                              "email": emailController.text.toString(),
                              "password": newPasswordController.text.toString(),
                              "number": number,
                              "pinCode": pinCode,
                              "address": address,
                              "locality": locality,
                              "city": city,
                              "state": state,
                            });
                            prefs.setString(
                                emailController.text.toString(), userData);
                            ToastMessage().showToast(
                                "Password successfully changed!",
                                context,
                                true);
                            Navigator.of(context).pop();
                            return;
                          }
                        }
                      },
                      child: Text(AppText.change.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
