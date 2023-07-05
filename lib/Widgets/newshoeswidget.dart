import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(blurRadius: 1,
            color: Colors.black87),
          ],
        ),
       child:Image.network(imageUrl),
      ),
    );
  }
}
