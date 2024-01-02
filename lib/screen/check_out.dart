import 'dart:convert';

import 'package:e_commerce/screen/address.dart';
import 'package:e_commerce/screen/success.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOut extends StatefulWidget {
  static const routeName = '/check-out-screen';

  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int delivery = 40;
  bool address = false;
  String name = "";
  String number = "";
  String userAddress = "";
  String pinCode = "";
  String locality = "";
  String city = "";
  String state = "";
  String emailId = "";
  String password = "";

  int _selectedRadioValue = 0;

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
    final productData = ModalRoute.of(context)!.settings.arguments as List;
    int couponPrice = productData[1];
    int totalPrice = productData[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "Check Out",
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
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price Details",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total MRP",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              "₹${totalPrice + couponPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coupon Discount",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              "-₹$couponPrice",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Charge",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            Text(
                              "₹$delivery",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.007),
                        const Divider(thickness: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                            Text(
                              "₹${totalPrice + delivery}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Card(
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
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Deliver to: "),
                                        Text(
                                          "$name, $pinCode",
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
                            foregroundColor:
                                AppColors.primaryColor.withOpacity(.8),
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
                SizedBox(height: size.height * 0.015),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.02,
                    ),
                    child: SizedBox(
                      width: size.width,
                      child: Text(
                        "Estimated delivery by Aug 1, 2023",
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                            top: size.height * 0.01,
                          ),
                          child: Text(
                            "Payment Method",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Google Pay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: _selectedRadioValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedRadioValue = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: _selectedRadioValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedRadioValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.colorWhite,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.005,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay Amount: ₹${totalPrice + delivery}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.45, size.height * 0.045),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      print(_selectedRadioValue);
                      if (!address) {
                        ToastMessage()
                            .showToast("Please Add Address", context, false);
                        return;
                      }
                      if (_selectedRadioValue > 2 || _selectedRadioValue < 1) {
                        ToastMessage().showToast(
                            "Please Select Payment Method", context, false);
                        return;
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Success.routeName, (route) => false);
                    },
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
