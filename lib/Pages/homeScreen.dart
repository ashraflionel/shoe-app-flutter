import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoe_app/Models/sneakers_model.dart';
import 'package:shoe_app/Services/helper.dart';
import 'package:shoe_app/Widgets/homeWidget.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

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
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: h * 0.4,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Athletics Shoes",style: appstylewithht(25, Colors.white, FontWeight.bold, 1.5)),
                    Text("Collection",style: appstylewithht(25, Colors.white, FontWeight.bold, 1.5)),
                    TabBar(
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
            ),
            
            Padding(
              padding: EdgeInsets.only(top: h * 0.265),
              child: TabBarView(
              controller: _tabController,
              children: [
                HomeWidget(h: h, section: _male,tabIndex: 0),
                HomeWidget(h: h, section: _female,tabIndex: 1),
                HomeWidget(h: h, section: _kids,tabIndex: 2),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
