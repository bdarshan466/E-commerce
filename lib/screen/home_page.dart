import 'package:e_commerce/screen/newCollection.dart';
import 'package:e_commerce/screen/productDetail.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_images.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> dummyData = [
    {
      "id": "1",
      "brand": "Xyz",
      "title": "Hoodie",
      "rating": "4",
      "ratedPeople": "7",
      "sale": "-15%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://images.pexels.com/photos/6311387/pexels-photo-6311387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "A stylish and comfortable hoodie for all occasions."
    },
    {
      "id": "2",
      "brand": "Abc",
      "title": "Cargo",
      "rating": "5",
      "ratedPeople": "11",
      "sale": "-20%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://assets.ajio.com/medias/sys_master/root/20230602/STfU/64792f66d55b7d0c63365635/-473Wx593H-461455469-olive-MODEL.jpg",
      "description":
          "Durable and functional cargo pants, perfect for outdoor activities."
    },
    {
      "id": "3",
      "brand": "Xyw",
      "title": "Dress",
      "rating": "2",
      "ratedPeople": "15",
      "sale": "-35%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://assets.ajio.com/medias/sys_master/root/20230623/E0re/6494fc7842f9e729d785c39b/-473Wx593H-464634840-multi-MODEL.jpg",
      "description":
          "An elegant dress that will make you stand out at any event."
    },
    {
      "id": "4",
      "brand": "Abg",
      "title": "T-Shirt",
      "rating": "3",
      "ratedPeople": "4",
      "sale": "-45%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/43e1522d-34b0-4c15-99fa-fe6efa747485/jordan-flight-essentials-oversized-t-shirt-C7XVkQ.png",
      "description": "A comfortable and stylish t-shirt with a modern design."
    },
    {
      "id": "5",
      "brand": "Abd",
      "title": "Sneaker",
      "rating": "4",
      "ratedPeople": "7k",
      "sale": "-10%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://5.imimg.com/data5/ANDROID/Default/2021/8/UR/IO/IT/54132075/product-jpeg-500x500.jpg",
      "description":
          "Trendy sneakers that provide comfort and style for your feet."
    },
    {
      "id": "6",
      "brand": "Xyz",
      "title": "Watch",
      "rating": "5",
      "ratedPeople": "1k",
      "sale": "-18%",
      "fakePrice": "1100",
      "realPrice": "900",
      "imageUrl":
          "https://images.pexels.com/photos/47856/rolex-wrist-watch-clock-gmt-47856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description":
          "A premium watch with a timeless design and precision mechanics."
    }
  ];

  List<bool> isFav = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.65,
                  width: size.width,
                  child: Image.asset(
                    AppImages.fashionSale,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.65,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.04,
                        ),
                        child: Text(
                          AppText.fashionSale,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.05,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.04,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: AppColors.primaryColor,
                            minimumSize:
                                Size(size.width * 0.35, size.height * 0.045),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                NewCollection.routeName,
                                arguments: "Fashion Sale");
                          },
                          child: const Text(AppText.check),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New",
                        style: TextStyle(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        AppText.neverSeen,
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: AppColors.colorGreyRobot,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(NewCollection.routeName,
                          arguments: "New Collection");
                    },
                    child: Text(
                      AppText.viewAll,
                      style: TextStyle(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              height: size.height * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductDetail.routeName, arguments: [
                              dummyData[index]["brand"]!,
                              dummyData[index]["title"]!,
                              dummyData[index]["rating"]!,
                              dummyData[index]["ratedPeople"]!,
                              dummyData[index]["sale"]!,
                              dummyData[index]["fakePrice"]!,
                              dummyData[index]["realPrice"]!,
                              dummyData[index]["imageUrl"]!,
                              dummyData[index]["description"]!,
                              dummyData[index]["id"]!,
                            ]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                                width: size.width * 0.4,
                                child: Image.network(
                                  dummyData[index]["imageUrl"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: size.height * 0.007),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: double.parse(
                                        dummyData[index]["rating"]!),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15,
                                    unratedColor: AppColors.colorGreyRobot,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (${dummyData[index]["ratedPeople"]!})",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                dummyData[index]["brand"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack.withOpacity(.6),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                dummyData[index]["title"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    dummyData[index]["fakePrice"]!,
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.6),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const Text(" ₹"),
                                  Text(
                                    dummyData[index]["realPrice"]!,
                                    style: TextStyle(
                                      color: AppColors.colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: size.height * 0.22,
                            left: size.width * 0.27,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorWhite,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFav[index] = !isFav[index];
                              });
                            },
                            icon: Icon(
                              isFav[index]
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: isFav[index]
                                  ? AppColors.primaryColor
                                  : AppColors.colorGreyRobot,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.colorBlack,
                          ),
                          child: Text(
                            "New",
                            style: TextStyle(color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sale",
                        style: TextStyle(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        AppText.superSummerSale,
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          color: AppColors.colorGreyRobot,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(NewCollection.routeName,
                          arguments: "Summer Sale");
                    },
                    child: Text(
                      AppText.viewAll,
                      style: TextStyle(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              height: size.height * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductDetail.routeName, arguments: [
                              dummyData[index]["brand"]!,
                              dummyData[index]["title"]!,
                              dummyData[index]["rating"]!,
                              dummyData[index]["ratedPeople"]!,
                              dummyData[index]["sale"]!,
                              dummyData[index]["fakePrice"]!,
                              dummyData[index]["realPrice"]!,
                              dummyData[index]["imageUrl"]!,
                              dummyData[index]["description"]!,
                              dummyData[index]["id"]!,
                            ]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                                width: size.width * 0.4,
                                child: Image.network(
                                  dummyData[index]["imageUrl"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: size.height * 0.007),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: double.parse(
                                        dummyData[index]["rating"]!),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15,
                                    unratedColor: AppColors.colorGreyRobot,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (${dummyData[index]["ratedPeople"]!})",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                dummyData[index]["brand"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack.withOpacity(.6),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                dummyData[index]["title"]!,
                                style: TextStyle(
                                  color: AppColors.colorBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    dummyData[index]["fakePrice"]!,
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.6),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const Text(" ₹"),
                                  Text(
                                    dummyData[index]["realPrice"]!,
                                    style: TextStyle(
                                      color: AppColors.colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: size.height * 0.22,
                            left: size.width * 0.27,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorWhite,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFav[index] = !isFav[index];
                              });
                            },
                            icon: Icon(
                              isFav[index]
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: isFav[index]
                                  ? AppColors.primaryColor
                                  : AppColors.colorGreyRobot,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.primaryColor,
                          ),
                          child: Text(
                            dummyData[index]["sale"]!,
                            style: TextStyle(color: AppColors.colorWhite),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(NewCollection.routeName,
                    arguments: "New Collection");
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child: Image.asset(
                      AppImages.newCollection,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.42,
                    left: size.width * 0.35,
                    child: Text(
                      AppText.newCollection,
                      style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.09,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(NewCollection.routeName,
                            arguments: "Summer Sale");
                      },
                      child: SizedBox(
                        height: size.height * 0.25,
                        width: size.width * 0.5,
                        child: Center(
                          child: Text(
                            AppText.summerSale,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.09,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(NewCollection.routeName,
                            arguments: "Black");
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            child: Image.asset(
                              AppImages.black,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.18,
                            left: size.width * 0.06,
                            child: Text(
                              AppText.black,
                              style: TextStyle(
                                color: AppColors.colorWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewCollection.routeName,
                        arguments: "Men's Hoodies");
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.5,
                        width: size.width * 0.5,
                        child: Image.asset(
                          AppImages.mensHoodies,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.5,
                        width: size.width * 0.5,
                        child: Center(
                          child: Text(
                            AppText.mensHoodies,
                            style: TextStyle(
                              color: AppColors.colorWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.09,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.08),
          ],
        ),
      ),
    );
  }
}
