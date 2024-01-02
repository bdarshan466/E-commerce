import 'dart:async';

import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBox {
  Future<bool> showClearCartConfirmationDialog(
      BuildContext context, String title, description) {
    // Create a Completer to handle the result asynchronously
    Completer<bool> completer = Completer<bool>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(title),
          content: Text(
            description,
            style: TextStyle(
              color: AppColors.colorBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
              onPressed: () {
                // When "No" is clicked, complete with false
                completer.complete(false);
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
              onPressed: () {
                // When "Yes" is clicked, complete with true
                if (title == "Clear Cart?") {
                  Provider.of<Products>(context, listen: false).clearCart();
                }
                if(title == "Logout") {
                  Prefrence().setLogin(false);
                }
                completer.complete(true);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    // Return the future of the completer's result
    return completer.future;
  }
}
