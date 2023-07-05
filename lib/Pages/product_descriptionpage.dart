import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Controllers/product_notifier.dart';
import 'package:shoe_app/Models/sneakers_model.dart';
import 'package:shoe_app/Services/helper.dart';
import 'package:shoe_app/Widgets/cart_button.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class ProdcuctPage extends StatefulWidget {
  const ProdcuctPage({super.key, required this.id, required this.type});
  final String id;
  final String type;

  @override
  State<ProdcuctPage> createState() => _ProdcuctPageState();
}

class _ProdcuctPageState extends State<ProdcuctPage> {
  final PageController pageController = PageController();
  final _cartBox = Hive.box('Cart_box');

  late Future<Sneakers> _sneakers;

  void getShoes() {
    if (widget.type == "Mens Collection") {
      _sneakers = Helper().getMaleSneakersById(widget.id);
    } else if (widget.type == "Womens Collection") {
      _sneakers = Helper().getFeMaleSneakersById(widget.id);
    } else {
      _sneakers = Helper().getKidsSneakersById(widget.id);
    }
  }

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder<Sneakers>(
            future: _sneakers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final _sneakers = snapshot.data;
                return Consumer<ProductNotifier>(
                    builder: (context, productNotifier, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  //productNotifier.shoeSizes.clear();
                                },
                                child: Icon(Icons.close, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.menu_open_outlined,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        expandedHeight: MediaQuery.of(context).size.height,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _sneakers!.imageUrl.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activepage = page;
                                  },
                                  itemBuilder: (context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: CachedNetworkImage(
                                            imageUrl: _sneakers.imageUrl[index],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          right: 20,
                                          child: Icon(Icons.favorite_outline,
                                              color: Colors.black),
                                        ),
                                        Positioned(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                _sneakers.imageUrl.length,
                                                (index) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor:
                                                        productNotifier
                                                                    .activepage !=
                                                                index
                                                            ? Colors.grey
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    );
                                  }),
                            ),
                            Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Container(
                                  height: h * 0.550,
                                  width: w,
                                  color: Color.fromARGB(255, 199, 198, 198),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _sneakers.name,
                                          style: appstyle(30, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(_sneakers.category,
                                                style: appstyle(
                                                    20,
                                                    Colors.black54,
                                                    FontWeight.w500)),
                                            SizedBox(width: 20),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 25,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 2),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                size: 5,
                                                color: Colors.black,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _sneakers.price,
                                              style: appstyle(
                                                  20,
                                                  Colors.black54,
                                                  FontWeight.w400),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Colors",
                                                  style: appstyle(
                                                      18,
                                                      Colors.black,
                                                      FontWeight.w400),
                                                ),
                                                SizedBox(width: 5),
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(width: 5),
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Select Sizes",
                                                    style: appstyle(
                                                        15,
                                                        Colors.black54,
                                                        FontWeight.w400)),
                                                SizedBox(width: 20),
                                                Text("View Size Guide",
                                                    style: appstyle(
                                                        15,
                                                        Colors.black54,
                                                        FontWeight.w400)),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                itemCount: productNotifier
                                                    .shoeSizes.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  print(
                                                      "Check Lemgth${productNotifier.shoeSizes.length}");
                                                  final sizes = productNotifier
                                                      .shoeSizes[index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: ChoiceChip(
                                                      selectedColor:
                                                          Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        side: BorderSide(
                                                          color: Colors.black,
                                                          width: 1,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                      ),
                                                      label: Text(sizes['size'],
                                                          style: appstyle(
                                                              18,
                                                              sizes['isSelected']
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              FontWeight.w500)),
                                                      selected: productNotifier
                                                              .shoeSizes[index]
                                                          ['isSelected'],
                                                      onSelected: (newState) {
                                                        if (productNotifier
                                                            .sizes
                                                            .contains(sizes[
                                                                'size'])) {
                                                          productNotifier.sizes
                                                              .remove(sizes[
                                                                  'size']);
                                                        } else {
                                                          productNotifier.sizes
                                                              .add(sizes[
                                                                  'size']);
                                                        }
                                                        print(
                                                            "Productsizes${productNotifier.sizes}");
                                                        print(
                                                            "ProductNotifier${productNotifier}");
                                                        productNotifier.toggleCheck(index);
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        const Divider(
                                          indent: 5,
                                          endIndent: 4,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 5),
                                        SizedBox(
                                          width: w * 0.8,
                                          child: Text(
                                            _sneakers.title,
                                            style: appstyle(15, Colors.black,
                                                FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(_sneakers.description,
                                            maxLines: 4,
                                            textAlign: TextAlign.justify,
                                            style: appstyle(15, Colors.black45,
                                                FontWeight.w500)),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: CheckOutButton(
                                            w: w,
                                            label: "Add to Cart",
                                            onTap: () async {
                                              _createCart({
                                                "id": _sneakers.id,
                                                "name": _sneakers.name,
                                                "category": _sneakers.category,
                                                "sizes": productNotifier.sizes,
                                                "imageUrl": _sneakers.imageUrl,
                                                "price": _sneakers.price,
                                                "qty": 1
                                              });
                                              productNotifier.sizes.clear();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                    ],
                  );
                });
              }
            }));
  }
}
