import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Controllers/mainscreen_provider.dart';
import 'package:shoe_app/Pages/favouriteScreen.dart';
import 'package:shoe_app/Widgets/bottomnavbar.dart';
import 'package:shoe_app/Pages/cartScreen.dart';
import 'package:shoe_app/Pages/homeScreen.dart';
import 'package:shoe_app/Pages/profileScreen.dart';
import 'package:shoe_app/Pages/seachScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
      return Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottomNavBar());
    });
  }
}
