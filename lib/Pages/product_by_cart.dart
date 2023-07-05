import 'package:flutter/material.dart';
import 'package:shoe_app/Models/sneakers_model.dart';
import 'package:shoe_app/Services/helper.dart';
import 'package:shoe_app/Widgets/category_btn.dart';
import 'package:shoe_app/Widgets/custom_spacer.dart';
import 'package:shoe_app/Widgets/productbycart_latestwidget.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});
  final int tabIndex;
  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {

  late final TabController _tabController = TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  List<String> brandImages = [
    "assets/images/adidas.png",
    "assets/images/puma.jpg",
    "assets/images/reebok.jpg",
    "assets/images/converse.png",
    "assets/images/dc.png",
    "assets/images/sparx.png",
  ];

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFeMaleSneakers();
  }

  void getkids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getkids();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body: SizedBox(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 25, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(Icons.menu_open, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(25, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: [
                      Tab(text: "Men Shoes"),
                      Tab(text: "Women Shoes"),
                      Tab(text: "Kids Shoes"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h * 0.175,
                left: 15,
                right: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(controller: _tabController, children: [
                  LatestShoes(latestShoes: _male),
                  LatestShoes(latestShoes: _female),
                  LatestShoes(latestShoes: _kids),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black,
        barrierColor: Colors.black,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.90,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        CustomSpacer(),
                        Text("Filter",style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        CustomSpacer(),
                        Text("Gender",style: appstyle(20, Colors.black, FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CategoryButton(buttonClr: Colors.black, label: "Men"),
                            CategoryButton(buttonClr: Colors.black, label: "Female"),
                            CategoryButton(buttonClr: Colors.black, label: "Kids"),
                          ],
                        ),
                        CustomSpacer(),
                        Text("Category",style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CategoryButton(buttonClr: Colors.black, label: "Shoes"),
                            CategoryButton(buttonClr: Colors.black, label: "Crocks"),
                            CategoryButton(buttonClr: Colors.black, label: "Coolers"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text("Price",style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        CustomSpacer(),
                        Slider(
                          value: _value,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          thumbColor: Colors.black,
                          max: 500,
                          divisions: 50,
                          label: _value.toString(),
                          secondaryTrackValue: 200,
                          onChanged: (double value) {},
                        ),
                        CustomSpacer(),
                        Text("Brands",style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          child: ListView.builder(
                            itemCount: brandImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Padding(padding: EdgeInsets.all(8),
                               child: Container(
                                   height: 75,
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15))),
                                     child: Image.asset(
                                        brandImages[index],
                                        height: 100,
                                        width: 80,
                                      ),
                                    ));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
