import 'package:e_commerce/screen/productDetail.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteItem extends StatefulWidget {
  static const routeName = '/favoriteItems-screen';

  const FavoriteItem({Key? key}) : super(key: key);

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool isList = true;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "Favorites",
          style: TextStyle(color: AppColors.colorBlack),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isList = !isList;
              });
            },
            icon: isList
                ? Icon(
                    Icons.view_list_rounded,
                    color: AppColors.colorBlack,
                  )
                : Icon(
                    Icons.grid_view_rounded,
                    color: AppColors.colorBlack,
                  ),
          ),
        ],
      ),
      body: isList
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                return Stack(
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
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.015),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.15,
                                width: size.width * 0.3,
                                child: Image.network(
                                  dummyData[index]["imageUrl"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dummyData[index]["title"]!,
                                      style: TextStyle(
                                        color: AppColors.colorBlack,
                                        fontSize: size.width * 0.06,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      dummyData[index]["brand"]!,
                                      style: TextStyle(
                                        color: AppColors.colorBlack
                                            .withOpacity(.6),
                                        fontSize: size.width * 0.04,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.007),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.parse(
                                              dummyData[index]["rating"]!),
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15,
                                          unratedColor:
                                              AppColors.colorGreyRobot,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          " (${dummyData[index]["ratedPeople"]!})",
                                          style: TextStyle(
                                            color: AppColors.colorBlack
                                                .withOpacity(.4),
                                            fontSize: size.width * 0.03,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.007),
                                    Text(
                                      "₹${dummyData[index]["realPrice"]!}",
                                      style: TextStyle(
                                        color: AppColors.colorBlack,
                                        fontSize: size.width * 0.045,
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
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.01, right: size.width * 0.02),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : GridView.builder(
              shrinkWrap: true,
              itemCount: dummyData.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width * .5,
                  childAspectRatio: size.aspectRatio * 1.4,
                  crossAxisSpacing: size.width * 0.02,
                  mainAxisSpacing: size.height * 0.01),
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
                              width: size.width * 0.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dummyData[index]["imageUrl"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.007),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating:
                                      double.parse(dummyData[index]["rating"]!),
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
                                    color: AppColors.colorBlack.withOpacity(.4),
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
                            Text(
                              "₹${dummyData[index]["realPrice"]!}",
                              style: TextStyle(
                                color: AppColors.colorBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
