import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body:  Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: Container(
                          height: 400,
                          child: Lottie.asset('assets/lottieimages/favorite.json',fit: BoxFit.contain),
                        ),
                      ),
                    ),
    );
  }
}
