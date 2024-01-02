import 'package:e_commerce/provider/product_model.dart';
import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/bottom_navbar.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/productDetail-screen';

  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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

  bool isInCart = false;

  List<Map<String, String>> reviews = [
    {
      "userName": "Helene Moore",
      "rating": "4",
      "rateDate": "June 5, 2023",
      "userImage":
          "https://images.pexels.com/photos/3775087/pexels-photo-3775087.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "review":
          "Comfy, stylish, and cozy hoodie! Excellent fit and soft material. Love the design and practical kangaroo pocket. My new go-to for chilly days! Highly recommend.",
    },
    {
      "userName": "Kim Shine",
      "rating": "5",
      "rateDate": "Jan 5, 2022",
      "userImage":
          "https://images.pexels.com/photos/3762824/pexels-photo-3762824.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "review":
          "Comfy, stylish, and cozy hoodie! Excellent fit and soft material. Love the design and practical kangaroo pocket. My new go-to for chilly days! Highly recommend.",
    },
  ];

  List<bool> isFavList = List.filled(6, false);
  String selectedSize = '';
  bool isFav = false;

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  List<Widget> _buildSizeWidgets(Size size) {
    List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

    return sizes.map((data) {
      bool isSelected = selectedSize == data;
      return GestureDetector(
        onTap: () => _selectSize(data),
        child: Container(
          width: size.width * 0.12,
          height: size.width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? AppColors.primaryColor.withOpacity(.8)
                : AppColors.colorTransparent,
            border: isSelected ? null : Border.all(),
          ),
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                color: isSelected ? AppColors.colorWhite : AppColors.colorBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = ModalRoute.of(context)!.settings.arguments as List<String>;
    String brand = data[0];
    String title = data[1];
    String rating = data[2];
    String ratedPeople = data[3];
    String sale = data[4];
    String fakePrice = data[5];
    String realPrice = data[6];
    String imageUrl = data[7];
    String description = data[8];
    String id = data[9];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          title,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.6,
                  width: size.width,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                    top: size.height * 0.01,
                  ),
                  child: Row(
                    children: [
                      Text(
                        brand,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.07),
                      ),
                      const Spacer(),
                      Text(
                        "₹$fakePrice",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                          color: AppColors.colorBlack.withOpacity(.5),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "₹$realPrice",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.colorGreyRobot,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.005),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: double.parse(rating),
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
                        " ($ratedPeople)",
                        style: TextStyle(
                          color: AppColors.colorBlack.withOpacity(.4),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                    top: size.height * 0.02,
                  ),
                  child: Text(
                    "Select Size",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.01,
                  ),
                  child: Wrap(
                    spacing: size.width * 0.02,
                    children: _buildSizeWidgets(size),
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    children: [
                      const Icon(Icons.delivery_dining_rounded),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        "Delivery by 24 July, Monday",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    children: [
                      const Icon(Icons.u_turn_left_rounded),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        "Easy 10 days return and exchange",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    children: [
                      const Icon(Icons.currency_rupee_rounded),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        "Cash on Delivery Available",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Text(
                    "You can also like this",
                    style: TextStyle(
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w600,
                    ),
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
                                Navigator.of(context).pushNamed(
                                    ProductDetail.routeName,
                                    arguments: [
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
                                        itemBuilder: (context, index) =>
                                            const Icon(
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
                                          color: AppColors.colorBlack
                                              .withOpacity(.4),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    dummyData[index]["brand"]!,
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.6),
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
                                          color: AppColors.colorBlack
                                              .withOpacity(.6),
                                          decoration:
                                              TextDecoration.lineThrough,
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
                                    isFavList[index] = !isFavList[index];
                                  });
                                },
                                icon: Icon(
                                  isFavList[index]
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  color: isFavList[index]
                                      ? AppColors.primaryColor
                                      : AppColors.colorGreyRobot,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01),
                  child: Text(
                    "Rating & Reviews",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.055,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  rating,
                                  style: TextStyle(fontSize: size.width * 0.15),
                                ),
                                const Icon(Icons.star, color: Colors.amber),
                              ],
                            ),
                            Text(
                              "$ratedPeople Ratings",
                              style: TextStyle(
                                color: AppColors.colorGreyRobot,
                                fontSize: size.width * 0.04,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.003,
                        color: AppColors.colorGreyRobot,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.55,
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: size.width * 0.06,
                                    unratedColor: AppColors.colorTransparent,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (3)",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 4,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: size.width * 0.06,
                                    unratedColor: AppColors.colorTransparent,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (2)",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 3,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: size.width * 0.06,
                                    unratedColor: AppColors.colorTransparent,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (1)",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 2,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: size.width * 0.06,
                                    unratedColor: AppColors.colorTransparent,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (1)",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 1,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: size.width * 0.06,
                                    unratedColor: AppColors.colorTransparent,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    " (0)",
                                    style: TextStyle(
                                      color:
                                          AppColors.colorBlack.withOpacity(.4),
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.035,
                          vertical: size.height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.05,
                                width: size.height * 0.05,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    reviews[index]["userImage"]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reviews[index]["userName"]!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.004),
                                  RatingBarIndicator(
                                    rating:
                                        double.parse(reviews[index]["rating"]!),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15,
                                    unratedColor: AppColors.colorGreyRobot,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                reviews[index]["rateDate"]!,
                                style: const TextStyle(
                                  color: AppColors.colorGreyRobot,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.14),
                            child: Text(
                              reviews[index]["review"]!,
                              style: TextStyle(
                                fontSize: size.width * 0.037,
                                color: AppColors.colorBlack.withOpacity(.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                /// Remove below code
                SizedBox(height: 100),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).canvasColor,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: Container(
                      height: size.height * 0.045,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colorBlack),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isFav
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: isFav ? AppColors.primaryColor : null,
                          ),
                          SizedBox(width: size.width * 0.02),
                          Text(
                            "Favorite",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.45, size.height * 0.045),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      if (selectedSize == "" && selectedSize.isEmpty) {
                        ToastMessage()
                            .showToast("Please Select Product Size!", context, false);
                        return;
                      }
                      if (!isInCart) {
                        Provider.of<Products>(context, listen: false).addToCart(
                          Product(
                            id: id,
                            title: title,
                            brand: brand,
                            imageUrl: imageUrl,
                            quantity: 1,
                            size: selectedSize,
                            realPrice: realPrice,
                            totalRP: realPrice,
                            fakePrice: fakePrice,
                            totalFP: fakePrice,
                            sale: sale,
                          ),
                        );
                      }
                      if (isInCart) {
                        Navigator.of(context)
                            .pushNamed(NavBar.routeName, arguments: 2);
                      }
                      setState(() {
                        isInCart = true;
                      });
                    },
                    icon: const Icon(
                      Icons.shopping_bag_rounded,
                    ),
                    label: Text(
                      isInCart ? "GO TO CART" : "ADD TO BAG",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
