import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_images.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Success extends StatelessWidget {
  static const routeName = '/success-screen';

  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<Products>(context, listen: false).clearCart();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.bags, height: size.height * 0.3),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: size.width * 0.1,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Your order will be delivered soon.\nThank you for choosing our app!",
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: AppColors.colorBlack,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      NavBar.routeName, (route) => false);
                },
                child: const Text("Continue Shopping"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
