import 'package:donut_app/utils/data.dart';
import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatefulWidget {
  const DonutTab({super.key});

  @override
  State<DonutTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<DonutTab> {
  //list of donuts


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
            id : donutsOnSale[index].id,
            donutFlavor: donutsOnSale[index].donutName,
            donutColor: donutsOnSale[index].donutColor,
            donutPrice: donutsOnSale[index].donutPrice,
            imageName: donutsOnSale[index].imageName
          );
      },
      ),
    );
  }
}