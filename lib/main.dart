import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Controllers/mainscreen_provider.dart';
import 'package:shoe_app/Controllers/product_notifier.dart';
import 'package:shoe_app/Pages/mainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox("fav_box");
  runApp(
    MultiProvider(
      providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(behavior: AppBehavior(), child: child!);
      },
      debugShowCheckedModeBanner: false,
      title: "Nike Stands",
      home: MainScreen(),
    );
  }
}

class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOversrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
