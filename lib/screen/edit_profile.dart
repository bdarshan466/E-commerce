import 'dart:convert';

import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit-profile-screen';

  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  bool _expanded = false;
  String password = "";
  String pinCode = "";
  String address = "";
  String locality = "";
  String city = "";
  String state = "";

  @override
  void initState() {
    userInfo();
    super.initState();
  }

  Future<void> userInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = await Prefrence().getEmail();
    if (!prefs.containsKey(email!)) {
      return;
    }
    Map<String, dynamic> extractedUserData =
        json.decode(prefs.getString(email)!);
    setState(() {
      nameController.text = extractedUserData["name"];
      numberController.text = extractedUserData["number"];
      emailController.text = extractedUserData["email"];
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
          elevation: 0,
          backgroundColor: AppColors.colorTransparent,
          title: Text(
            "Edit Profile",
            style: TextStyle(color: AppColors.colorBlack),
          ),
          centerTitle: true,
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Text(
                          "User Details",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorColor: AppColors.colorBlack,
                              decoration: InputDecoration(
                                labelText: AppText.name,
                                labelStyle: TextStyle(
                                  color: AppColors.colorGreyRobot,
                                  fontSize: size.width * 0.035,
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.015),
                            TextField(
                              controller: numberController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              cursorColor: AppColors.colorBlack,
                              maxLength: 10,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              decoration: InputDecoration(
                                labelText: "Mobile No.",
                                labelStyle: TextStyle(
                                  color: AppColors.colorGreyRobot,
                                  fontSize: size.width * 0.035,
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.015),
                            TextField(
                              controller: emailController,
                              enabled: false,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: AppColors.colorBlack,
                              maxLength: 10,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: AppColors.colorGreyRobot,
                                  fontSize: size.width * 0.035,
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.colorGreyRobot,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    AnimatedContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      duration: const Duration(milliseconds: 300),
                      height: _expanded ? size.height * 0.3 : size.height * 0.07,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                icon: Icon(_expanded
                                    ? Icons.expand_less
                                    : Icons.expand_more),
                                onPressed: () {
                                  setState(() {
                                    _expanded = !_expanded;
                                  });
                                },
                              ),
                            ],
                          ),
                          Card(
                            elevation: 2,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.015),
                              height: _expanded ? size.height * 0.185 : 0,
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.03),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Visibility(
                                        visible: _expanded,
                                        maintainSize: false,
                                        maintainAnimation: false,
                                        child: TextField(
                                          controller: passwordController,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          cursorColor: AppColors.colorBlack,
                                          decoration: InputDecoration(
                                            labelText: "Old Password",
                                            labelStyle: TextStyle(
                                              color: AppColors.colorGreyRobot,
                                              fontSize: size.width * 0.035,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.colorGreyRobot,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.colorGreyRobot,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.015),
                                      Visibility(
                                        visible: _expanded,
                                        maintainSize: false,
                                        maintainAnimation: false,
                                        child: TextField(
                                          controller: newPassController,
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          cursorColor: AppColors.colorBlack,
                                          maxLength: 10,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          decoration: InputDecoration(
                                            labelText: "New Password",
                                            labelStyle: TextStyle(
                                              color: AppColors.colorGreyRobot,
                                              fontSize: size.width * 0.035,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.colorGreyRobot,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.colorGreyRobot,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width, size.height * 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () async {
                      focusScopeNode.unfocus();
                      if (nameController.text.isEmpty) {
                        ToastMessage()
                            .showToast("Please enter your Name", context, false);
                        return;
                      }
                      if (numberController.text.isEmpty) {
                        ToastMessage().showToast(
                            "Please enter your Number", context, false);
                        return;
                      }
                      if(passwordController.text.toString().isNotEmpty){
                        if(passwordController.text.toString() != password){
                          ToastMessage().showToast(
                              "Incorrect old password.", context, false);
                          return;
                        }
                        if(passwordController.text.toString() == password){
                          if(newPassController.text.toString().isEmpty){
                            ToastMessage().showToast(
                                "Please enter new Password", context, false);
                            return;
                          }else {
                            final prefs = await SharedPreferences.getInstance();
                            final userData = json.encode({
                              "name": nameController.text.toString(),
                              "email": emailController.text.toString(),
                              "password": newPassController.text.toString(),
                              "number": numberController.text.toString(),
                              "pinCode": pinCode,
                              "address": address,
                              "locality": locality,
                              "city": city,
                              "state": state,
                            });
                            prefs.setString(emailController.text.toString(), userData);
                            Navigator.of(context).pop();
                            return;
                          }
                        }
                      }
                      final prefs = await SharedPreferences.getInstance();
                      final userData = json.encode({
                        "name": nameController.text.toString(),
                        "email": emailController.text.toString(),
                        "password": password,
                        "number": numberController.text.toString(),
                        "pinCode": pinCode,
                        "address": address,
                        "locality": locality,
                        "city": city,
                        "state": state,
                      });
                      prefs.setString(emailController.text.toString(), userData);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
