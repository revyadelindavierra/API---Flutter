import 'package:bab_4/pages/Rincian_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Kotakk extends StatelessWidget {
  Kotakk({super.key});

  final List<String> imagePaths = [
    "images/salty_food.png",
    "images/sugar_rush.png",
    "images/sweetness.png",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.76,
      children: [
        for (int i = 0; i < 3; i++)
          //buat berapa kotaknya aja karna dari 0 jadi ada 3 kotak
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF232227),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RincianPage()),
                    );
                  },
                  child: Container(
                    child: Image.asset(imagePaths[i],
                        width: 140, height: 140, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 15),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pizza Salty",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 2, left: 15),
                  child: Text(
                    "New Menu",
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp344",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      Icon(
                        CupertinoIcons.cart_badge_plus,
                        size: 27,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
