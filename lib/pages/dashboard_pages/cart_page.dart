import 'package:flutter/material.dart';
import 'package:food_odering_app/pages/payment_method_page.dart';
// ignore: depend_on_referenced_packages
//import 'package:food_ordering_app/pages/payment_method_page.dart'; // Import PaymentMethodPage

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Cart items
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Chicken Cheese Pasta",
      "price": 1300.00,
      "quantity": 1,
      "image": "assets/images/gentle-tummy-lemon-chicken-pasta-cottage-cheese-recipe-13.jpg",
    },
    {
      "name": "Chocolate Milkshake",
      "price": 750.00,
      "quantity": 2,
      "image": "assets/images/Thick-chocolate-mikshake-1.jpg",
    },
  ];

  double deliveryFee = 250.00;

  // Calculate subtotal
  double getSubtotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = getSubtotal();
    double totalAmount = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text("Rs ${item['price'].toStringAsFixed(2)}"),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                item['quantity'].toString(),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    item['quantity']++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Payment Summary
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: TextStyle(fontSize: 16)),
                      Text("Rs ${subtotal.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee", style: TextStyle(fontSize: 16)),
                      Text("Rs ${deliveryFee.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        "Rs ${totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle adding more items
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(14),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text("Add Item", style: TextStyle(fontSize: 16, color: Colors.green)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentMethodPage(getTotalAmount: totalAmount)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text("Checkout", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
