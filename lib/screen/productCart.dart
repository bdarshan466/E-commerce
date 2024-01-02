import 'package:e_commerce/provider/product_model.dart';
import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/screen/check_out.dart';
import 'package:e_commerce/screen/productDetail.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/dialog_box.dart';
import 'package:e_commerce/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductCart extends StatefulWidget {
  static const routeName = '/cart-screen';

  const ProductCart({Key? key}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  var _expanded = false;

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

  List<bool> isFavList = List.filled(6, false);

  List<Map<String, String>> offers = [
    {
      "imageUrl":
          "https://images.pexels.com/photos/5650026/pexels-photo-5650026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "title": "Personal Offer",
      "code": "FIRST50",
      "days": "6 Days remaining"
    },
    {
      "imageUrl":
          "https://previews.123rf.com/images/nohanbudiono/nohanbudiono1908/nohanbudiono190800354/129030326-summer-sale-discount-promo-abstract-background-template-design-vector.jpg",
      "title": "Summer Sale",
      "code": "SUMMER2023",
      "days": "10 Days remaining"
    },
    {
      "imageUrl":
          "https://t3.ftcdn.net/jpg/03/36/91/14/360_F_336911489_vQzdGPLdY0aNYXdu5rK7UIwwiEksYJgK.jpg",
      "title": "Personal Offer",
      "code": "PROMO25",
      "days": "26 Days remaining"
    },
  ];

  int totalPrice = 0;
  bool coupon = false;
  int couponPrice = 0;
  String couponCode = "";

  @override
  void didChangeDependencies() {
    final cartList = Provider.of<Products>(context).items;
    var t = 0;
    for (int i = 0; i < cartList.length; i++) {
      t = t + int.parse(cartList[i].totalRP);
    }
    setState(() {
      if (coupon) {
        totalPrice = t - couponPrice;
      } else {
        totalPrice = t;
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartList = Provider.of<Products>(context).items;
    if (totalPrice == 0) {
      for (int i = 0; i < cartList.length; i++) {
        totalPrice = totalPrice + int.parse(cartList[i].totalRP);
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorTransparent,
        title: Text(
          "My Bag",
          style: TextStyle(color: AppColors.colorBlack),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price : ₹$totalPrice",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () async {
                            /// Clear Cart
                            if (totalPrice != 0) {
                              var res = await DialogBox()
                                  .showClearCartConfirmationDialog(context,'Clear Cart?','Are you sure you want to clear your cart?');
                              if (res) {
                                if (cartList.isEmpty) {
                                  totalPrice = 0;
                                  coupon = false;
                                  couponCode = "";
                                  couponPrice = 0;
                                } else {
                                  totalPrice = 0;
                                }
                              }
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_forever_rounded,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Remove",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                cartList.isEmpty
                    ? Container(
                        alignment: Alignment.bottomCenter,
                        height: size.height * 0.38,
                        child: Text(
                          "Your Bag is Empty.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: size.height * 0.03),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Card(
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
                                        height: size.height * 0.16,
                                        width: size.width * 0.3,
                                        child: Image.network(
                                          cartList[index].imageUrl,
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
                                              cartList[index].brand,
                                              style: TextStyle(
                                                color: AppColors.colorBlack,
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.003),
                                            Text(
                                              cartList[index].title,
                                              style: TextStyle(
                                                color: AppColors.colorBlack,
                                                fontSize: size.width * 0.037,
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.004),
                                            Row(
                                              children: [
                                                Text(
                                                  "Size : ${cartList[index].size}",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.1),
                                                Text(
                                                  "Q : ",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize:
                                                        size.width * 0.045,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    var q = cartList[index]
                                                        .quantity;
                                                    if (q > 1) {
                                                      q = q - 1;
                                                      setState(() {
                                                        for (int i = 0;
                                                            i < cartList.length;
                                                            i++) {
                                                          if (couponCode ==
                                                              "FIRST50") {
                                                            totalPrice = (totalPrice -
                                                                    int.parse(
                                                                        cartList[i]
                                                                            .realPrice) +
                                                                    couponPrice) ~/
                                                                2;
                                                            if (totalPrice >
                                                                400) {
                                                              totalPrice =
                                                                  (totalPrice *
                                                                          2) -
                                                                      400;
                                                              couponPrice = 400;
                                                            } else {
                                                              couponPrice =
                                                                  totalPrice;
                                                            }
                                                          } else if (couponCode ==
                                                              "SUMMER2023") {
                                                            totalPrice = (totalPrice -
                                                                    int.parse(
                                                                        cartList[i]
                                                                            .realPrice) +
                                                                    couponPrice) ~/
                                                                2;
                                                            couponPrice =
                                                                totalPrice;
                                                          } else if (couponCode ==
                                                              "PROMO25") {
                                                            totalPrice = totalPrice -
                                                                int.parse(cartList[
                                                                        i]
                                                                    .realPrice) +
                                                                couponPrice;
                                                            couponPrice =
                                                                (totalPrice *
                                                                        20) ~/
                                                                    100;
                                                            totalPrice =
                                                                totalPrice -
                                                                    couponPrice;
                                                          } else {
                                                            totalPrice = totalPrice -
                                                                int.parse(cartList[
                                                                        i]
                                                                    .realPrice);
                                                          }
                                                        }
                                                      });
                                                      var rp = int.parse(
                                                          cartList[index]
                                                              .realPrice);
                                                      var fp = int.parse(
                                                          cartList[index]
                                                              .fakePrice);
                                                      rp = rp * q;
                                                      fp = fp * q;
                                                      Provider.of<Products>(
                                                              context,
                                                              listen: false)
                                                          .updateProduct(
                                                        cartList[index].id,
                                                        Product(
                                                          id: cartList[index]
                                                              .id,
                                                          title: cartList[index]
                                                              .title,
                                                          brand: cartList[index]
                                                              .brand,
                                                          imageUrl:
                                                              cartList[index]
                                                                  .imageUrl,
                                                          quantity: q,
                                                          size: cartList[index]
                                                              .size,
                                                          realPrice:
                                                              cartList[index]
                                                                  .realPrice,
                                                          totalRP:
                                                              rp.toString(),
                                                          fakePrice:
                                                              cartList[index]
                                                                  .fakePrice,
                                                          totalFP:
                                                              fp.toString(),
                                                          sale: cartList[index]
                                                              .sale,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.015),
                                                Text(
                                                  cartList[index]
                                                      .quantity
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        size.width * 0.045,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.015),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      for (int i = 0;
                                                          i < cartList.length;
                                                          i++) {
                                                        if (couponCode ==
                                                                "FIRST50" &&
                                                            couponPrice !=
                                                                400) {
                                                          totalPrice = totalPrice +
                                                              int.parse(cartList[
                                                                      i]
                                                                  .realPrice) +
                                                              couponPrice -
                                                              400;
                                                          couponPrice = 400;
                                                        } else if (couponCode ==
                                                            "FIRST50") {
                                                          totalPrice = totalPrice +
                                                              int.parse(cartList[
                                                                      i]
                                                                  .realPrice);
                                                        } else if (couponCode ==
                                                            "SUMMER2023") {
                                                          totalPrice = (totalPrice +
                                                                  int.parse(
                                                                      cartList[
                                                                              i]
                                                                          .realPrice) +
                                                                  couponPrice) ~/
                                                              2;
                                                          couponPrice =
                                                              totalPrice;
                                                        } else if (couponCode ==
                                                            "PROMO25") {
                                                          int a = (totalPrice +
                                                              int.parse(cartList[
                                                                      i]
                                                                  .realPrice) +
                                                              couponPrice);
                                                          couponPrice =
                                                              (a * 20) ~/ 100;
                                                          totalPrice =
                                                              totalPrice -
                                                                  couponPrice;
                                                        }
                                                      }
                                                    });
                                                    var q = cartList[index]
                                                        .quantity;
                                                    q = q + 1;
                                                    var rp = int.parse(
                                                        cartList[index]
                                                            .realPrice);
                                                    var fp = int.parse(
                                                        cartList[index]
                                                            .fakePrice);
                                                    rp = rp * q;
                                                    fp = fp * q;
                                                    Provider.of<Products>(
                                                            context,
                                                            listen: false)
                                                        .updateProduct(
                                                      cartList[index].id,
                                                      Product(
                                                        id: cartList[index].id,
                                                        title: cartList[index]
                                                            .title,
                                                        brand: cartList[index]
                                                            .brand,
                                                        imageUrl:
                                                            cartList[index]
                                                                .imageUrl,
                                                        quantity: q,
                                                        size: cartList[index]
                                                            .size,
                                                        realPrice:
                                                            cartList[index]
                                                                .realPrice,
                                                        totalRP: rp.toString(),
                                                        fakePrice:
                                                            cartList[index]
                                                                .fakePrice,
                                                        totalFP: fp.toString(),
                                                        sale: cartList[index]
                                                            .sale,
                                                      ),
                                                    );
                                                  },
                                                  child: const Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: size.height * 0.005),
                                            Row(
                                              children: [
                                                Text(
                                                  "₹${cartList[index].totalRP}",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.015),
                                                Text(
                                                  "₹${cartList[index].totalFP}",
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .colorGreyRobot,
                                                    fontSize: size.width * 0.04,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.015),
                                                Text(
                                                  cartList[index].sale,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: size.width * 0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: size.height * 0.005),
                                            Row(
                                              children: [
                                                Text(
                                                  "Delivery by ",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontSize:
                                                        size.width * 0.032,
                                                  ),
                                                ),
                                                Text(
                                                  "Aug 1, 2023",
                                                  style: TextStyle(
                                                    color: AppColors.colorBlack,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        size.width * 0.032,
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
                              Container(
                                margin: EdgeInsets.only(
                                  right: size.width * 0.02,
                                  top: size.height * 0.01,
                                ),
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<Products>(context,
                                            listen: false)
                                        .removeProductById(cartList[index].id);
                                    setState(() {
                                      if (cartList.isEmpty) {
                                        totalPrice = 0;
                                        coupon = false;
                                        couponCode = "";
                                        couponPrice = 0;
                                      } else {
                                        totalPrice = 0;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                if (cartList.isNotEmpty) const Divider(thickness: 2),
                if (cartList.isNotEmpty)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _expanded ? size.height * 0.5 : size.height * 0.09,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Best Coupon for You",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.colorBlack,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(_expanded
                                  ? Icons.expand_less
                                  : Icons.expand_more),
                              onPressed: () {
                                setState(() {
                                  _expanded = !_expanded;
                                });
                              },
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.015),
                            height: _expanded ? size.height * 0.4 : 0,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 0),
                              children: offers
                                  .map(
                                    (offer) => Card(
                                      elevation: 3,
                                      margin: EdgeInsets.only(
                                        left: size.width * 0.03,
                                        right: size.width * 0.03,
                                        top: size.height * 0.015,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    offer["title"]!,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.colorBlack,
                                                      fontSize:
                                                          size.width * 0.045,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.003),
                                                  Text(
                                                    offer["code"]!,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.colorBlack,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: size.width * 0.265,
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      offer["days"]!,
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .colorGreyRobot,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.003),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      backgroundColor: AppColors
                                                          .primaryColor,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (couponPrice != 0 &&
                                                            totalPrice != 0) {
                                                          totalPrice =
                                                              totalPrice +
                                                                  couponPrice;
                                                        }
                                                        if (offer["code"] ==
                                                            "FIRST50") {
                                                          couponCode =
                                                              "FIRST50";
                                                          totalPrice =
                                                              ((totalPrice) -
                                                                      (totalPrice /
                                                                          2))
                                                                  .toInt();
                                                          if (totalPrice >
                                                              400) {
                                                            totalPrice =
                                                                (totalPrice *
                                                                        2) -
                                                                    400;

                                                            coupon = true;
                                                            couponPrice = 400;
                                                          } else {
                                                            coupon = true;
                                                            couponPrice =
                                                                totalPrice;
                                                          }
                                                          ToastMessage().showToast(
                                                              "Yay! You saved ₹ $couponPrice with one coupon.",
                                                              context,
                                                              true);
                                                          _expanded = false;
                                                        }
                                                        if (offer["code"] ==
                                                            "SUMMER2023") {
                                                          couponCode =
                                                              "SUMMER2023";
                                                          totalPrice =
                                                              ((totalPrice) -
                                                                      (totalPrice /
                                                                          2))
                                                                  .toInt();
                                                          coupon = true;
                                                          couponPrice =
                                                              totalPrice;
                                                          ToastMessage().showToast(
                                                              "Yay! You saved ₹ $couponPrice with one coupon.",
                                                              context,
                                                              true);
                                                          _expanded = false;
                                                        }
                                                        if (offer["code"] ==
                                                            "PROMO25") {
                                                          couponCode =
                                                              "PROMO25";
                                                          couponPrice =
                                                              (totalPrice *
                                                                      20) ~/
                                                                  100;
                                                          totalPrice =
                                                              totalPrice -
                                                                  couponPrice;
                                                          coupon = true;
                                                          ToastMessage().showToast(
                                                              "Yay! You saved ₹ $couponPrice with one coupon.",
                                                              context,
                                                              true);
                                                          _expanded = false;
                                                        }
                                                      });
                                                    },
                                                    child: offer["code"] ==
                                                            couponCode
                                                        ? const Text("Remove")
                                                        : const Text("Apply"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (cartList.isNotEmpty) SizedBox(height: size.height * 0.01),
                if (cartList.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You can also like this",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                if (cartList.isNotEmpty) SizedBox(height: size.height * 0.015),
                if (cartList.isNotEmpty)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                if (cartList.isNotEmpty) SizedBox(height: size.height * 0.15),
              ],
            ),
          ),
          if (cartList.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width, size.height * 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CheckOut.routeName, arguments: [
                        totalPrice,
                        couponPrice,
                      ]);
                    },
                    child: const Text("Check Out"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
