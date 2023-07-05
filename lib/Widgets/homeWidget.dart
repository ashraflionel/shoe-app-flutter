import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Controllers/product_notifier.dart';
import 'package:shoe_app/Models/sneakers_model.dart';
import 'package:shoe_app/Pages/product_by_cart.dart';
import 'package:shoe_app/Pages/product_descriptionpage.dart';
import 'package:shoe_app/Widgets/newshoeswidget.dart';
import 'package:shoe_app/Widgets/productcard.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key,
      required this.h,
      required Future<List<Sneakers>> section,
      required this.tabIndex})
      : _section = section;

  final double h;
  final Future<List<Sneakers>> _section;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Container(
            height: h * 0.405,
            child: FutureBuilder<List<Sneakers>>(
                future: _section,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    print("CheckMale${male}");
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          print("check id${shoe}");
                          print("check id${shoe.id}");
                          return GestureDetector(
                            onTap: () {
                              productNotifier.shoesSizes = shoe.sizes;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProdcuctPage(
                                          id: shoe.id, type: shoe.type)));
                            },
                            child: ProductCard(
                                price: shoe.price,
                                category: shoe.category,
                                id: shoe.id,
                                name: shoe.name,
                                image: shoe.imageUrl[0]),
                          );
                        });
                  }
                }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Latest Shoes",
                        style: appstyle(18, Colors.black, FontWeight.normal)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductByCart(tabIndex: tabIndex)));
                      },
                      child: Row(
                        children: [
                          Text("Show All",
                              style: appstyle(
                                  18, Colors.black, FontWeight.normal)),
                          Icon(Icons.arrow_circle_up_rounded, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: h * 0.12,
            child: FutureBuilder<List<Sneakers>>(
                future: _section,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: NewShoes(imageUrl: shoe.imageUrl[0]),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
