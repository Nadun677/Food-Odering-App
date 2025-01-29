import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  // Cart items
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Chicken Cheese Pasta",
      "price": 1300.00,
      "quantity": 1,
      "image": "assets/images/gentle-tummy-lemon-chicken-pasta-cottage-cheese-recipe-13.jpg", // Replace with actual image URL
    },
    {
      "name": "Chocolate Milkshake",
      "price": 750.00,
      "quantity": 2,
      "image": "assets/images/Thick-chocolate-mikshake-1.jpg", // Replace with actual image URL
    },
  ];

  double deliveryFee = 250.00;

  // Calculate subtotal
  double getSubtotal() {
    double subtotal = 0.0;
    for (var item in cartItems) {
      subtotal += item['price'] * item['quantity'];
    }
    return subtotal;
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
            // Cart Items
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
                          // Item Image
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

                          // Item Details
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

                          // Quantity Control
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

            // Add Food Button
            TextButton.icon(
              onPressed: () {
                // Add food functionality
              },
              icon: Icon(Icons.add, color: Colors.green),
              label: Text(
                "Add Food",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 12),

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

                  // Promo Code Field
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.local_offer, color: Colors.green),
                      hintText: "Enter your promo code",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 12),

                  // Subtotal and Delivery Fee
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

                  // Total Amount
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

            // Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Add item functionality
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(14),
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text(
                      "Add Item",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Checkout functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
