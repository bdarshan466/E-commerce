import 'package:e_commerce/screen/newCollection.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Coupons extends StatefulWidget {
  static const routeName = '/coupons-screen';

  const Coupons({Key? key}) : super(key: key);

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  List<Map<String, String>> offers = [
    {
      "imageUrl":
          "https://images.pexels.com/photos/5650026/pexels-photo-5650026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "title": "Personal Offer",
      "code": "FIRST50",
      "days": "6 Days remaining",
      "off": "50% off UpTo ₹400",
    },
    {
      "imageUrl":
          "https://previews.123rf.com/images/nohanbudiono/nohanbudiono1908/nohanbudiono190800354/129030326-summer-sale-discount-promo-abstract-background-template-design-vector.jpg",
      "title": "Summer Sale",
      "code": "SUMMER2023",
      "days": "10 Days remaining",
      "off": "Flat 50% off",
    },
    {
      "imageUrl":
          "https://t3.ftcdn.net/jpg/03/36/91/14/360_F_336911489_vQzdGPLdY0aNYXdu5rK7UIwwiEksYJgK.jpg",
      "title": "Personal Offer",
      "code": "PROMO25",
      "days": "26 Days remaining",
      "off": "Flat 20% off",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "Coupons",
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
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 0),
        children: offers
            .map(
              (offer) => InkWell(
                onTap: () {
                  if (offer["code"]! == "FIRST50") {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "New Collection");
                  }
                  if (offer["code"]! == "SUMMER2023") {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Summer Sale");
                  }
                  if (offer["code"]! == "PROMO25") {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Fashion Sale");
                  }
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                    top: size.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.width * 0.25,
                          width: size.width * 0.25,
                          child: Image.network(
                            offer["imageUrl"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer["title"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: size.height * 0.003),
                              Text(
                                offer["code"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              SizedBox(height: size.height * 0.003),
                              Text(
                                offer["off"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
