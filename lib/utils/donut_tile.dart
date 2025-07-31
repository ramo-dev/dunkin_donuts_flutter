import 'package:donut_app/pages/donut_page.dart';
import 'package:flutter/material.dart';

class DonutTile extends StatefulWidget {
  final String donutFlavor;
  final donutColor;
  final String donutPrice;
  final String imageName;
  final int id;


  const DonutTile({
    super.key,
    required this.id,
    required this.donutFlavor,
    required this.donutColor,
    required this.donutPrice,
    required this.imageName
    });

  @override
  State<DonutTile> createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  final double borderRadius = 12;

  bool liked = false;

  void likeDonut(){
    setState(() {
      liked = liked == true ? false : true;
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: 
          (_) => DonutPage(donutIndex: widget.id)
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.donutColor[50],
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: widget.donutColor[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft : Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius)
                        )
                      ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '\$${widget.donutPrice}', style: TextStyle(
                      color: widget.donutColor[800],
                      fontWeight: FontWeight.bold, 
                      fontSize: 18
                    ),),
                    ),
                ],
              ),
                Hero(
                  tag: 'donut-${widget.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 16
                    ),
                  child: Image.asset(widget.imageName,),
                ),
                ),
              ), 
              Text(widget.donutFlavor, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              ),
      
              const SizedBox(height: 4),
      
              Text('Bakeinn', style: TextStyle(
                color: Colors.grey[600]
              ),),
      
      
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.pink[0],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius)
                      )
                    ),
                    onPressed: likeDonut,
                    icon: Icon(
                      Icons.favorite,
                      color: liked ? Colors.pink : Colors.grey,
                    ),
                  ),
                  IconButton(
                    splashColor: Colors.pink[200],
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}