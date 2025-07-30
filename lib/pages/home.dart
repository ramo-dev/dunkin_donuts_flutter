import 'package:donut_app/tabs/burger_tab.dart';
import 'package:donut_app/tabs/donut_tab.dart';
import 'package:donut_app/tabs/pancake_tab.dart';
import 'package:donut_app/tabs/pizza_tab.dart';
import 'package:donut_app/tabs/smoothie_tab.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> myTabs = const [
   MyTab(
      iconPath: 'lib/icons/donut.png',
    ),
    MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
    MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
     MyTab(
      iconPath: 'lib/icons/pizza.png',
    ),
     
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left : 24.0),
            child: IconButton(
              icon : Icon(
                Icons.menu,
                color: Colors.grey,
                size : 36
            ),
            onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right : 24.0),
              child: IconButton(
                onPressed: () {},
                icon:Icon(
                  Icons.person,
                  color: Colors.grey,
                  size : 36
              ) 
                 ),
            )
          ],
        ),
        body : Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18.0),
              child: Row(
                children: const [
                  Text('I Want to', 
                  style: TextStyle(
                    fontSize: 24,
                    
                  ),),
                   Text(' EAT', 
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
      
            const SizedBox(height: 24,),

            TabBar(tabs: myTabs),

            Expanded(
              child: TabBarView(
                children: [
                //donut page
                DonutTab(),

                //burger page
                BurgerTab(),

                //smoothie page
                SmoothieTab(),

                //pancake page
                PancakeTab(),

                //pizza page
                PizzaTab()

              ]),
            )
          ],
        )
      ),
    );
  }
}