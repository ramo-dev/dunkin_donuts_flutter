import 'package:flutter/material.dart';

class Donut {
  final int id;
  final String donutName;
  final String donutPrice;
  final donutColor; 
  final String imageName;
  final String donutDescription;

  const Donut({
    required this.id,
    required this.donutName,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
    required this.donutDescription, 
  });
}

final List<Donut> donutsOnSale = [
  Donut(
    id: 1,
    donutName: "Ice Cream",
    donutPrice: "36",
    donutColor: Colors.blue,
    imageName: "lib/images/icecream_donut.png",
    donutDescription: "A cool and creamy delight that melts in your mouth. Perfect for a hot day!",
  ),
  Donut(
    id: 2,
    donutName: "Strawberry",
    donutPrice: "45",
    donutColor: Colors.red,
    imageName: "lib/images/strawberry_donut.png",
    donutDescription: "Sweet and fruity, bursting with strawberry flavor. A classic choice!",
  ),
  Donut(
    id: 3,
    donutName: "Chocolate",
    donutPrice: "84",
    donutColor: Colors.brown,
    imageName: "lib/images/chocolate_donut.png",
    donutDescription: "Rich and decadent, a chocolate lover's dream. Indulge yourself, buda!",
  ),
  Donut(
    id: 4,
    donutName: "Grape Ape",
    donutPrice: "55",
    donutColor: Colors.purple,
    imageName: "lib/images/grape_donut.png",
    donutDescription: "A unique and tangy grape flavor that will leave you wanting more. Noma sana!",
  ),
];
