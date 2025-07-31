import 'package:donut_app/pages/donut_page.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/utils/data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Donut> cartItems = List.from(donutsOnSale); 
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    totalPrice = cartItems.fold(0, (sum, item) => sum + double.parse(item.donutPrice));
  }

  void _removeFromCart(int id) {
    setState(() {
      cartItems.removeWhere((item) => item.id == id);
      _calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Cart looking hella dry 😭'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final donut = cartItems[index];
                return GestureDetector(
                  onTap: () {
                        Navigator.push(
                        context, 
                        MaterialPageRoute(builder: 
                        (_) => DonutPage(donutIndex: donut.id)
                        )
                      );
                    },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'donut-${donut.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              donut.imageName,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                donut.donutName,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${donut.donutPrice}',
                                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeFromCart(donut.id),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: cartItems.isEmpty
          ? SizedBox.shrink()
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  FilledButton(
                    onPressed: () {
                      // TODO: Add payment pain here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Checking out... chill bruh 💳')),
                      );
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
    );
  }
}
