import 'package:flutter/material.dart';
import 'package:food_odering_app/pages/dashboard_pages/food_details_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/food_details_page3.dart';
import 'package:food_odering_app/pages/dashboard_pages/food_details_page4.dart';
import 'package:food_odering_app/pages/dashboard_pages/oders_page.dart';
import 'package:food_odering_app/pages/food/strawberry_page.dart';
import 'package:food_odering_app/pages/food_details_page1.dart';
import 'package:food_odering_app/pages/food_details_page2.dart';
import 'package:food_odering_app/pages/oders/oders_page1.dart';
import 'package:food_odering_app/pages/oders/oders_page2.dart';
import 'package:food_odering_app/pages/oders/oders_page3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'What do you want to eat?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16),

            // Special Offer Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special Offer for Today',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We are here with the Best Burgers in town.',
                    style: TextStyle(color: Colors.green.shade700),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('View'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Today's New Arrival
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today New Arrival',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Food Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image:
                          'assets/images/grilled-cheeseburgers-melted-cheese-toppings.webp',
                      name: 'Cheese Burger',
                      location: 'Culinary Canvas Café',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage1(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image: 'assets/images/chicken-Biryani-848x477.jpg',
                      name: 'Chicken Biryani',
                      location: 'Ambrosia Resturant',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage2(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image:
                          'assets/images/grilled-cheeseburgers-melted-cheese-toppings.webp',
                      name: 'Beef Burger',
                      location: 'Culinary Canvas Café',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage4(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image:
                          'assets/images/gentle-tummy-lemon-chicken-pasta-cottage-cheese-recipe-13.jpg',
                      name: 'Chicken Pasta ',
                      location: 'Ambrosia Resturant',
                    ),
                  ),
                  SizedBox(width: 8),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage3(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image: 'assets/images/Thick-chocolate-mikshake-1.jpg',
                      name: 'Choco Milkshake',
                      location: 'Java Junction',
                    ),
                  ),
                  SizedBox(width: 8),


                                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Strawbeerypage(),
                        ),
                      );
                    },
                    child: FoodCard(
                      image: 'assets/images/Banana-Strawberry-Milkshake-Featured-Image.jpg',
                      name: 'Strawberry Milkshake',
                      location: 'Java Junction',
                    ),
                  ),
                  SizedBox(height: 16),

                ],
              ),
            ),

            // Booking Restaurant
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking Restaurant',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Restaurant Cards
            Column(
              children: [
                BookingCard(
                  image: 'assets/images/70259830.webp',
                  name: 'Ambrosia Hotel & Resturant',
                  location: 'Ambrosia Hotel & Resturant',
                  rating: 4.5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OdersPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8),
                BookingCard(
                  image: 'assets/images/images.jpeg',
                  name: 'Tava Resturant',
                  location: 'Tava Resturant',
                  rating: 4.5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OdersPage1(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8),
                BookingCard(
                  image: 'assets/images/images.jpeg',
                  name: 'Culinary Canva CAfe',
                  location: 'Culinary Canva CAfe ',
                  rating: 4.8,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OdersPage2(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8),
                BookingCard(
                  image: 'assets/images/images.jpeg',
                  name: 'Java Junction',
                  location: 'Java Junction',
                  rating: 4.7,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OdersPage3(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;

  const FoodCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String image;
  final Function() onTap;

  const BookingCard({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.green),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            rating.toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: onTap,
            child: Text('Book'),
          ),
        ],
      ),
    );
  }
}
