import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          child: Stack(
            children: 
              [
                Container(
                height: h * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        width: double.infinity,
                        height: h / 14.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 226, 221, 221),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          cursorColor:Colors.black,
                          decoration: InputDecoration(
                              hintText: "Search Shoes",
                              hintStyle:const TextStyle(fontSize: 10, color: Colors.black54),
                              suffixIcon: Icon(Icons.search,
                              color: Colors.black87),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: Container(
                          height: 400,
                          child: Lottie.asset('assets/lottieimages/ghost.json',fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
