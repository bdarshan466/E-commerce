import 'dart:convert';

import 'package:e_commerce/screen/address.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressList extends StatefulWidget {
  static const routeName = '/address-list-screen';

  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  bool address = false;
  String name = "";
  String number = "";
  String pinCode = "";
  String userAddress = "";
  String locality = "";
  String city = "";
  String state = "";
  String emailId = "";
  String password = "";

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
      emailId = email;
      if (extractedUserData["name"] != "" &&
          extractedUserData["password"] != "") {
        name = extractedUserData["name"];
        password = extractedUserData["password"];
      }
      if (extractedUserData["number"] != "" &&
          extractedUserData["pinCode"] != "" &&
          extractedUserData["address"] != "" &&
          extractedUserData["locality"] != "" &&
          extractedUserData["city"] != "" &&
          extractedUserData["state"] != "") {
        number = extractedUserData["number"];
        pinCode = extractedUserData["pinCode"];
        userAddress = extractedUserData["address"];
        locality = extractedUserData["locality"];
        city = extractedUserData["city"];
        state = extractedUserData["state"];
        address = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "Shipping Address",
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
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Padding(
          padding: address
              ? EdgeInsets.symmetric(
                  vertical: size.height * 0.015,
                  horizontal: size.width * 0.02,
                )
              : EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.65,
                child: address
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text("Name: "),
                              Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.008),
                          Text(
                            "$userAddress, $locality, $city, $state",
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          SizedBox(height: size.height * 0.008),
                          Row(
                            children: [
                              const Text("Mobile: "),
                              Text(
                                number,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.008),
                          Row(
                            children: [
                              const Text("Pin Code: "),
                              Text(
                                pinCode,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Text(
                        "Add Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.04,
                        ),
                      ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor.withOpacity(.8),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Address.routeName)
                      .then((value) => getAddress());
                },
                child: Text(
                  address ? "CHANGE" : "ADD",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
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
