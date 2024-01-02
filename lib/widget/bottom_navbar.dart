import 'package:e_commerce/screen/Profile.dart';
import 'package:e_commerce/screen/categories.dart';
import 'package:e_commerce/screen/favorite_items.dart';
import 'package:e_commerce/screen/home_page.dart';
import 'package:e_commerce/screen/productCart.dart';
import 'package:e_commerce/screen/sign_up.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavBar extends StatefulWidget {
  static const routeName = '/navBar-screen';

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  var currentIndex = 0;
  late List<Map<String, Widget>> _screen;

  @override
  void initState() {
    super.initState();
    Prefrence().setLogin(true);
    _screen = [
      {
        "screen": HomePage(),
      },
      {
        "screen": const Categories(),
      },
      {
        "screen": const ProductCart(),
      },
      {
        "screen": const FavoriteItem(),
      },
      {
        "screen": const Profile(),
      },
    ];
  }

  @override
  void didChangeDependencies() {
    var index = ModalRoute.of(context)!.settings.arguments;
    index ??= 0;
    setState(() {
      currentIndex = index as int;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _screen[currentIndex]["screen"],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.colorGreyRobot.withOpacity(.7),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .17,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .18 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? AppColors.primaryColor.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .17,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .076,
                    color: index == currentIndex
                        ? AppColors.primaryColor.withOpacity(.85)
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.shopping_cart_rounded,
    Icons.shopping_bag_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];
}
