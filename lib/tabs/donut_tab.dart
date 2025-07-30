import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {

  //list of donuts

  List donutsOnSale = const [
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Chocolate", "84", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Grape Ape", "55", Colors.purple, "lib/images/grape_donut.png"],

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
      itemCount: donutsOnSale.length,
      gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/1.5
      )
      , itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutColor: donutsOnSale[index][2],
            donutPrice: donutsOnSale[index][1],
            imageName: donutsOnSale[index][3]
          );
      },
      ),
    );
  }
}