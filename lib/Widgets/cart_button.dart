import 'package:flutter/material.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
    required this.w, this.onTap, required this.label,
  });

  final double w;
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: GestureDetector(
        onTap:onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            height: 50,
            width: w * 0.9,
            child: Center(
              child: Text(
                label,
                style: appstyle(20, Colors.white, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
