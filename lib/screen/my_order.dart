import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyOrder extends StatefulWidget {
  static const routeName = '/order-screen';

  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<Map<String, dynamic>> dummyData = [
    {
      "id": "1",
      "brand": "Xyz",
      "title": "Hoodie",
      "size": "S",
      "imageUrl":
          "https://images.pexels.com/photos/6311387/pexels-photo-6311387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "A stylish and comfortable hoodie for all occasions.",
      "date": "On Sun, 2 Apr",
      "exchangeDate": "Exchange/Return window closed on 12 Apr",
    },
    {
      "id": "2",
      "brand": "Abc",
      "title": "Cargo",
      "size": "M",
      "imageUrl":
          "https://assets.ajio.com/medias/sys_master/root/20230602/STfU/64792f66d55b7d0c63365635/-473Wx593H-461455469-olive-MODEL.jpg",
      "description":
          "Durable and functional cargo pants, perfect for outdoor activities.",
      "date": "On Mon, 17 Jul",
      "exchangeDate": "Exchange/Return window closed on 27 Jul",
    },
  ];

  final double _initialRate = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "My Order",
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
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            color: AppColors.colorGrey,
            margin: EdgeInsets.only(
              left: size.width * 0.03,
              right: size.width * 0.03,
              bottom: size.height * 0.02,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivered",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    dummyData[index]["date"]!,
                    style: TextStyle(
                      color: AppColors.colorBlack.withOpacity(.6),
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.01,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.15,
                            child: Image.network(
                              dummyData[index]["imageUrl"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyData[index]["brand"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                  color: AppColors.colorBlack,
                                ),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                dummyData[index]["title"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.03,
                                  color: AppColors.colorBlack.withOpacity(.6),
                                ),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                "Size: ${dummyData[index]["size"]!}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.035,
                                  color: AppColors.colorBlack,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "Rate Product",
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: size.height * 0.005),
                              RatingBar.builder(
                                initialRating: _initialRate,
                                minRating: 1,
                                direction: Axis.horizontal,
                                unratedColor: AppColors.colorGreyRobot,
                                itemCount: 5,
                                itemSize: size.width * 0.05,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.001),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                                updateOnDrag: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    dummyData[index]["exchangeDate"]!,
                    style: TextStyle(
                      color: AppColors.colorBlack.withOpacity(.6),
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
