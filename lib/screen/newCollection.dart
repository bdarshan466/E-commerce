import 'package:e_commerce/screen/productDetail.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewCollection extends StatefulWidget {
  static const routeName = '/newCollection-screen';

  const NewCollection({Key? key}) : super(key: key);

  @override
  State<NewCollection> createState() => _NewCollectionState();
}

class _NewCollectionState extends State<NewCollection> {
  bool isSearch = false;
  bool isLow = false;
  bool isList = true;

  String _searchQuery = "";

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

  List<String> categories = [
    "T-shirt",
    "Hoodies",
    "Watches",
    "Jeans",
    "Shoes",
  ];

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      setState(() {
        isSearch = false;
        _searchQuery = '';
      });
    }));
    setState(() {
      isSearch = true;
    });
  }

  List<bool> isSelected = List.filled(5, false);
  List<bool> isFav = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode focusScopeNode = FocusScope.of(context);
    var title = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.colorTransparent,
          title: isSearch
              ? Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.colorBlack, width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.024),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      cursorColor: AppColors.colorBlack,
                      decoration: const InputDecoration(
                        hintText: "Search here....",
                        hintStyle: TextStyle(color: AppColors.colorGreyRobot),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: AppColors.colorBlack,
              ),
              onPressed: () {
                setState(() {
                  _startSearch();
                });
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  height: size.height * 0.04,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isSelected[index]
                                ? AppColors.primaryColor.withOpacity(.8)
                                : AppColors.colorTransparent,
                            border: isSelected[index]
                                ? null
                                : Border.all(
                                    color: AppColors.colorBlack,
                                    width: 2,
                                  ),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: isSelected[index]
                                    ? AppColors.colorWhite
                                    : AppColors.colorBlack,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.colorBlack,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_rounded),
                        label: const Text("Filters"),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.colorBlack,
                        ),
                        onPressed: () {
                          setState(() {
                            isLow = !isLow;
                          });
                        },
                        icon: isLow
                            ? const Icon(Icons.arrow_upward_rounded)
                            : const Icon(Icons.arrow_downward_rounded),
                        label: isLow
                            ? const Text("Price : Low to High")
                            : const Text("Price : High to Low"),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isList = !isList;
                          });
                        },
                        icon: isList
                            ? const Icon(Icons.view_list_rounded)
                            : const Icon(Icons.grid_view_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              child: isList
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: dummyData.length,
                      itemBuilder: (context, index) {
                        return Stack(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            SizedBox(
                                                height: size.height * 0.007),
                                            Row(
                                              children: [
                                                RatingBarIndicator(
                                                  rating: double.parse(
                                                      dummyData[index]
                                                          ["rating"]!),
                                                  itemBuilder:
                                                      (context, index) =>
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
                                            SizedBox(
                                                height: size.height * 0.007),
                                            Row(
                                              children: [
                                                Text(
                                                  "₹${dummyData[index]["fakePrice"]!}",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: AppColors
                                                        .colorGreyRobot,
                                                    fontSize: size.width * 0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "  ₹${dummyData[index]["realPrice"]!}",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize: size.width * 0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "  ${dummyData[index]["sale"]!}",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: size.width * 0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.13,
                                    right: size.width * 0.03),
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
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      dummyData[index]["brand"]!,
                                      style: TextStyle(
                                        color: AppColors.colorBlack
                                            .withOpacity(.6),
                                        fontSize: size.width * 0.04,
                                      ),
                                    ),
                                    Text(
                                      dummyData[index]["title"]!,
                                      style: TextStyle(
                                        color: AppColors.colorBlack,
                                        fontSize: size.width * 0.047,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹${dummyData[index]["fakePrice"]!}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.colorGreyRobot,
                                            fontSize: size.width * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "  ₹${dummyData[index]["realPrice"]!}",
                                          style: TextStyle(
                                            color: AppColors.colorBlack,
                                            fontSize: size.width * 0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * 0.075),
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
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.01),
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
          ],
        ),
      ),
    );
  }
}
