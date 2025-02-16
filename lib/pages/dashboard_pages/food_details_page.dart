import 'package:flutter/material.dart';
import 'package:food_odering_app/data/food_data.dart';
import 'package:food_odering_app/data/user_data.dart';
import 'package:food_odering_app/models/food_model.dart';
import 'package:food_odering_app/models/user_model.dart';
import 'package:food_odering_app/pages/dashboard_pages/cart_page.dart';

class FoodDetailsPage extends StatefulWidget {
  final String foodId;

  const FoodDetailsPage({
    super.key,
    required this.foodId,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // Get food data
  final foodList = FoodData().foodList;
  late FoodModel food;

  // get user
  final userData = user;

  int quantity = 1;
  double price = 0;
  double totalPrice = 0;
  double spiciness = 0.2;

  @override
  void initState() {
    super.initState();
    food = foodList.firstWhere((element) => element.foodId == widget.foodId);
    price = food.foodPrice;
    totalPrice = price;
  }

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
            Image.asset(
              food.foodImageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.foodName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text(food.foodRating.toString(),
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rs ${food.foodPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(food.foodDescription,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  SizedBox(height: 15),
                  Text("",
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
            Text(
              "Rs ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)),
  ),
  onPressed: () {
    // Create a customized copy for the cart
    final cartItem = food.copyWith(
      quantity: quantity,
      spiciness: spiciness,
    );
    
    // Add to user's cart
    user.addFoodCart(cartItem);
    
    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Added to Cart!"),
        duration: Duration(seconds: 2))
    );
    
    // Navigate to cart
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => CartScreen()));
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
