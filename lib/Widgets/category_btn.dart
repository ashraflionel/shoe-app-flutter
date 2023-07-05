import 'package:flutter/material.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, this.onpress, required this.buttonClr, required this.label});
  final void Function()? onpress;
  final Color buttonClr;
  final String label;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.240,
        decoration: BoxDecoration(
          border:Border.all(width: 1, color: buttonClr, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(label,
            style: appstyle(20, buttonClr, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
