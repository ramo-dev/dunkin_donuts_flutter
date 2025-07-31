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
  final bool _isDark = false;

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
      child: Theme(
        data: _isDark ? ThemeData.dark() : ThemeData.light(),
        child : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 36,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right : 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:Icon(
                        Icons.shopping_bag,
                        color: Colors.grey,
                        size : 36
                      ),
                      onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                      },
                    ),
                    IconButton(
                      icon:Icon(
                        Icons.person,
                        color: Colors.grey,
                        size : 36
                      ),
                      onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          body : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: const [
                    Text('Welcome back Annuar', 
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),)
                  ],
                ),
              ),
        
              const SizedBox(height: 10,),
        
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
      ),
    );
  }
}