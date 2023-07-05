import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body:  Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: Container(
                          height: 400,
                          child: Lottie.asset('assets/lottieimages/cart.json',fit: BoxFit.contain),
                        ),
                      ),
                    ),
    );
  }
}
