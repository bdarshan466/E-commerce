import 'package:e_commerce/screen/newCollection.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  static const routeName = '/categories-screen';

  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

const double todayAlign = -1;
const double weekAlign = 0;
const double monthAlign = 1;
const Color selectedColor = Colors.white;
Color normalColor = AppColors.colorBlack;

class _CategoriesState extends State<Categories> {
  String selected = "Women";

  late double xAlign;
  late Color todayColor;
  late Color weekColor;
  late Color monthColor;

  @override
  void initState() {
    xAlign = todayAlign;
    todayColor = selectedColor;
    weekColor = normalColor;
    monthColor = normalColor;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String newCollectionUrl = "";
    String clothsUrl = "";
    String shoesUrl = "";
    String accessoriesUrl = "";
    if (selected == "Women") {
      newCollectionUrl =
          "https://images.pexels.com/photos/7679863/pexels-photo-7679863.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      clothsUrl =
          "https://images.pexels.com/photos/1488463/pexels-photo-1488463.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      shoesUrl =
          "https://images.pexels.com/photos/2285500/pexels-photo-2285500.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      accessoriesUrl =
          "https://images.pexels.com/photos/15622999/pexels-photo-15622999/free-photo-of-golden-necklace-on-woman.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    } else if (selected == "Men") {
      newCollectionUrl =
          "https://images.pexels.com/photos/1639729/pexels-photo-1639729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      clothsUrl =
          "https://images.pexels.com/photos/3812433/pexels-photo-3812433.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      shoesUrl =
          "https://images.pexels.com/photos/167706/pexels-photo-167706.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      accessoriesUrl =
          "https://franchiseindia.s3.ap-south-1.amazonaws.com/uploads/content/fi/art/5b69706d6655d.jpg";
    } else if (selected == "Kids") {
      newCollectionUrl =
          "https://images.pexels.com/photos/6349542/pexels-photo-6349542.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      clothsUrl =
          "https://cdn.shopify.com/s/files/1/2192/5961/files/gender-neutral-kids-clothes-orbasics_1024x1024.jpg?v=1610114014";
      shoesUrl =
          "https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
      accessoriesUrl =
          "https://images.pexels.com/photos/8084241/pexels-photo-8084241.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
                AppText.categories,
                style: TextStyle(color: AppColors.colorBlack),
              ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: size.width,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: Alignment(xAlign, 0),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: size.width * 0.6 * 0.5,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = todayAlign;
                        todayColor = selectedColor;
                        monthColor = normalColor;
                        weekColor = normalColor;
                        selected = "Women";
                      });
                    },
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: Container(
                        width: size.width * 0.6 * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Women',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: todayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = weekAlign;
                        weekColor = selectedColor;
                        monthColor = normalColor;
                        todayColor = normalColor;
                        selected = "Men";
                      });
                    },
                    child: Align(
                      alignment: const Alignment(0, 0),
                      child: Container(
                        width: size.width * 0.6 * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Men',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: weekColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = monthAlign;
                        monthColor = selectedColor;
                        weekColor = normalColor;
                        todayColor = normalColor;
                        selected = "Kids";
                      });
                    },
                    child: Align(
                      alignment: const Alignment(1, 0),
                      child: Container(
                        width: size.width * 0.6 * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Kids',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: monthColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.08),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: size.height * 0.01),
                // summer sale
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Summer Sale");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    color: AppColors.primaryColor.withOpacity(.85),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            AppText.summerSale.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.07,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Up to 50% off",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                // New Collection
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "New Collection");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                "New",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.06,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Image.network(
                              newCollectionUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                // Cloths section
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Clothes");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                AppText.clothes,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.06,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Image.network(
                              clothsUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                // Shoes section
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Shoes");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                AppText.shoes,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.06,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Image.network(
                              shoesUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                // Accessories section
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Accessories");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Center(
                              child: Text(
                                AppText.accessories,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.06,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.45,
                            child: Image.network(
                              accessoriesUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
