import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/screen/Profile.dart';
import 'package:e_commerce/screen/address.dart';
import 'package:e_commerce/screen/address_list.dart';
import 'package:e_commerce/screen/categories.dart';
import 'package:e_commerce/screen/check_out.dart';
import 'package:e_commerce/screen/coupons.dart';
import 'package:e_commerce/screen/edit_profile.dart';
import 'package:e_commerce/screen/favorite_items.dart';
import 'package:e_commerce/screen/my_order.dart';
import 'package:e_commerce/screen/newCollection.dart';
import 'package:e_commerce/screen/productCart.dart';
import 'package:e_commerce/screen/productDetail.dart';
import 'package:e_commerce/screen/splash.dart';
import 'package:e_commerce/screen/success.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/screen/forgot_password.dart';
import 'package:e_commerce/screen/home_page.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:e_commerce/screen/sign_up.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData theme =
    ThemeData(canvasColor: const Color.fromRGBO(240, 225, 230, 1));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: AppColors.primaryColor),
        ),
        home: Splash(),
        routes: {
          Login.routeName: (context) => const Login(),
          SignUp.routeName: (context) => const SignUp(),
          ForgotPassword.routeName: (context) => const ForgotPassword(),
          HomePage.routeName: (context) => const HomePage(),
          NavBar.routeName: (context) => NavBar(),
          Categories.routeName: (context) => const Categories(),
          NewCollection.routeName: (context) => const NewCollection(),
          ProductDetail.routeName: (context) => const ProductDetail(),
          FavoriteItem.routeName: (context) => const FavoriteItem(),
          ProductCart.routeName: (context) => const ProductCart(),
          CheckOut.routeName: (context) => const CheckOut(),
          Address.routeName: (context) => const Address(),
          Success.routeName: (context) => const Success(),
          Profile.routeName: (context) => const Profile(),
          MyOrder.routeName: (context) => const MyOrder(),
          AddressList.routeName: (context) => const AddressList(),
          Coupons.routeName: (context) => const Coupons(),
          EditProfile.routeName: (context) => const EditProfile(),
        },
      ),
    );
  }
}
