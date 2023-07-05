import 'package:flutter/material.dart';
import 'package:shoe_app/constants.dart/textStyles.dart';

class StageerTile extends StatefulWidget {
  const StageerTile({super.key, required this.imageUrl, required this.name, required this.price});
  final String imageUrl;
  final String name;
  final String price;
  @override
  State<StageerTile> createState() => _StageerTileState();
}

class _StageerTileState extends State<StageerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 150,
              child: Image.network(widget.imageUrl)),
            Container(
              padding: EdgeInsets.only(top: 12),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: appstylewithht(20, Colors.black, FontWeight.w500,1)),
                  Text(widget.price,style: appstylewithht(20, Colors.black, FontWeight.w500,1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
