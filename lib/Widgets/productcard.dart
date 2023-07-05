import 'package:flutter/material.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool itsAdded = false;

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: h,
          width: w * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 1, color: Colors.black26),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: h * 0.23,
                    decoration: BoxDecoration(
                        image:DecorationImage(image: NetworkImage(widget.image),
                        fit: BoxFit.cover)),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          print("Added Your Favourites");
                        },
                        child: itsAdded == false
                            ? Icon(Icons.favorite_outline,)
                            : Icon(Icons.favorite,),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    Text(
                      widget.name,
                      style: appstyle(25, Colors.black, FontWeight.bold),
                    ),
                    Text(
                      widget.category,
                      style: appstyle(25, Colors.grey, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appstyle(30, Colors.black, FontWeight.bold),
                    ),
                    Row(children: [
                      Text("Colors",
                      style: appstyle(18, Colors.grey, FontWeight.w500)),
                      SizedBox(width: 5),
                      ChoiceChip(
                        label: Text(""),
                        selected: selected,
                        visualDensity: VisualDensity.compact,
                        selectedColor: Colors.black,
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
