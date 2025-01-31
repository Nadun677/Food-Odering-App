import 'package:flutter/material.dart';
import 'package:food_odering_app/pages/dashboard_pages/cart_page.dart';

class FoodDetailsPage1 extends StatefulWidget {
  const FoodDetailsPage1({super.key});

  @override
  _FoodDetailsPage1State createState() => _FoodDetailsPage1State();
}

class _FoodDetailsPage1State extends State<FoodDetailsPage1> {
  int quantity = 1;
  double price = 1700.00;
  double totalPrice = 1700.00;
  double spiciness = 0.2; // Default spiciness level

  void updateTotalPrice() {
    setState(() {
      totalPrice = price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Food Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image
            Image.asset(
              "assets/images/chicken-Biryani-848x477.jpg",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Name
                  Text(
                    "Chicken Biryani",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      Icon(Icons.star_border, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text("4.3 (59 reviews)", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Price
                  Text(
                    "Rs ${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),

                  // Description
                  Text(
                    "The classic Chicken Biryani remains a timeless favorite. Tender, flavorful chicken cooked with fragrant basmati rice, aromatic spices, and caramelized onions creates an irresistible taste. Served with raita or a side of curry, it’s a perfect meal for any occasion.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 15),

                  // Spicy Level Slider
                  Text("Spicy",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Slider(
                    value: spiciness,
                    onChanged: (value) {
                      setState(() {
                        spiciness = value;
                      });
                    },
                    min: 0,
                    max: 1,
                    divisions: 10,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                  ),

                  SizedBox(height: 10),

                  // Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quantity",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                  updateTotalPrice();
                                });
                              }
                            },
                          ),
                          Text(quantity.toString(),
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                quantity++;
                                updateTotalPrice();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Price
            Text(
              "Rs ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),

            // Add to Cart Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Added to Cart!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
              label: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
