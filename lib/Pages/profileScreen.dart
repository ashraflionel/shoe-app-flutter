import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 199, 198, 198),
        body:  Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: Container(
                          height: 400,
                          child: Lottie.asset('assets/lottieimages/profile.json',fit: BoxFit.contain),
                        ),
                      ),
                    ),
    );
  }
}
