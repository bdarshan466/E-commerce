import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  void showToast(String msg, BuildContext context, bool positive) {
    Size size = MediaQuery.of(context).size;
    FToast().init(context);
    FToast().showToast(
      toastDuration: const Duration(seconds: 4),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: positive ? Colors.green : AppColors.primaryColor.withOpacity(.9),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: FittedBox(
              child: Text(
                msg,
                style: TextStyle(
                  color: AppColors.colorWhite,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
