import 'dart:convert';

import 'package:e_commerce/screen/address_list.dart';
import 'package:e_commerce/screen/coupons.dart';
import 'package:e_commerce/screen/edit_profile.dart';
import 'package:e_commerce/screen/my_order.dart';
import 'package:e_commerce/screen/sign_up.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:e_commerce/widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile-screen';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = "Username";
  String emailId = "Email";

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
      userName = extractedUserData["name"];
      emailId = extractedUserData["email"];
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
          "Profile",
          style: TextStyle(color: AppColors.colorBlack),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.015,
                  horizontal: size.width * 0.02,
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.height * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(.5),
                      ),
                      child: Center(
                        child: Text(
                          userName.substring(0, 1).toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          emailId,
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(EditProfile.routeName).then((value) => userInfo());
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyOrder.routeName);
                  },
                  title: Text(
                    "My Orders",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(AddressList.routeName);
                  },
                  title: Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(Coupons.routeName);
                  },
                  title: Text(
                    "Coupons",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(NavBar.routeName, arguments: 3);
                  },
                  title: Text(
                    "Favorites",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "FAQs",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Card(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, size.height * 0.05),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.colorWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  var res = await DialogBox().showClearCartConfirmationDialog(
                      context, "Logout", "Are you sure you want to Logout?");
                  if (res) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignUp.routeName, (route) => false);
                  }
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04,
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
