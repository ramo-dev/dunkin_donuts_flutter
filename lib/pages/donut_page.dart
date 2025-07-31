import 'package:donut_app/utils/data.dart';
import 'package:flutter/material.dart';

class DonutPage extends StatefulWidget {
  final int donutIndex;

  const DonutPage({
    super.key,
    required this.donutIndex
    });


  @override
  State<DonutPage> createState() => _DonutPageState();
}

class _DonutPageState extends State<DonutPage> {
  late final Donut donut;
  bool liked = false;


  @override
  void initState(){
    super.initState();
    donut = donutsOnSale.firstWhere((d) => d.id == widget.donutIndex);
  }

 void likeDonut(){
    setState(() {
      liked = liked == true ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: donut.donutColor,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: donut.donutColor[200],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'donut-${donut.id}',
                  child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 30),
                    child: Image.asset(donut.imageName),
                  ),
                ),
                  )
                ,
                SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        donut.donutName,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${donut.donutPrice}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                Text(donut.donutDescription, 
                style: TextStyle(
                  fontSize: 20
                ),)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: donut.donutColor[200]
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: likeDonut,
                    icon: Icon(
                      Icons.favorite, 
                      size: 32,
                      color: liked ? Colors.pink : Colors.blueGrey,
                      ),
                  ),
                ),
                Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: donut.donutColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text('Order now', style : TextStyle(
                        fontSize: 16
                      )),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  }
}