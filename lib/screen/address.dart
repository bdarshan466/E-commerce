import 'dart:convert';

import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Address extends StatefulWidget {
  static const routeName = '/address-screen';

  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  String password = "";
  String emailId = "";

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    pinCodeController.dispose();
    addressController.dispose();
    localityController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAddress();
    super.initState();
  }

  Future<void> getAddress() async {
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
      emailId = extractedUserData["email"];
      password = extractedUserData["password"];
      if (extractedUserData["pinCode"] != "" &&
          extractedUserData["address"] != "" &&
          extractedUserData["locality"] != "" &&
          extractedUserData["city"] != "" &&
          extractedUserData["state"] != "") {
        pinCodeController.text = extractedUserData["pinCode"];
        addressController.text = extractedUserData["address"];
        localityController.text = extractedUserData["locality"];
        cityController.text = extractedUserData["city"];
        stateController.text = extractedUserData["state"];
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
            "Address",
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
                          "Contact Details",
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Text(
                          "Address",
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
                              controller: pinCodeController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              cursorColor: AppColors.colorBlack,
                              maxLength: 6,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              decoration: InputDecoration(
                                labelText: "Pin Code",
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
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorColor: AppColors.colorBlack,
                              decoration: InputDecoration(
                                labelText:
                                    "Address (House No, Building, Street, Area)",
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
                              controller: localityController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorColor: AppColors.colorBlack,
                              decoration: InputDecoration(
                                labelText: "Locality / Town",
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
                              controller: cityController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorColor: AppColors.colorBlack,
                              decoration: InputDecoration(
                                labelText: "City",
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
                              controller: stateController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              cursorColor: AppColors.colorBlack,
                              decoration: InputDecoration(
                                labelText: "State",
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
                        ToastMessage().showToast(
                            "Please enter your Name", context, false);
                        return;
                      }
                      if (numberController.text.isEmpty) {
                        ToastMessage().showToast(
                            "Please enter your Number", context, false);
                        return;
                      }
                      if (pinCodeController.text.isEmpty) {
                        ToastMessage()
                            .showToast("Please enter PinCode", context, false);
                        return;
                      }
                      if (addressController.text.isEmpty) {
                        ToastMessage()
                            .showToast("Please enter Address", context, false);
                        return;
                      }
                      if (localityController.text.isEmpty) {
                        ToastMessage().showToast(
                            "Please enter Locality / Town", context, false);
                        return;
                      }
                      if (cityController.text.isEmpty) {
                        ToastMessage()
                            .showToast("Please enter City", context, false);
                        return;
                      }
                      if (stateController.text.isEmpty) {
                        ToastMessage()
                            .showToast("Please enter State", context, false);
                        return;
                      }
                      if (numberController.text.length > 10 ||
                          numberController.text.length < 10) {
                        ToastMessage().showToast(
                            "Please enter valid Mobile Number", context, false);
                        return;
                      }
                      if (pinCodeController.text.length > 6 ||
                          pinCodeController.text.length < 6) {
                        ToastMessage().showToast(
                            "Please enter valid PinCode", context, false);
                        return;
                      }
                      final prefs = await SharedPreferences.getInstance();
                      final userData = json.encode({
                        "name": nameController.text.toString(),
                        "email": emailId,
                        "password": password,
                        "number": numberController.text.toString(),
                        "pinCode": pinCodeController.text.toString(),
                        "address": addressController.text.toString(),
                        "locality": localityController.text.toString(),
                        "city": cityController.text.toString(),
                        "state": stateController.text.toString(),
                      });
                      print(userData);
                      prefs.setString(emailId, userData);
                      Navigator.pop(context);
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
