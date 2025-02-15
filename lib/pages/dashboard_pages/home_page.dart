import 'package:flutter/material.dart';
import 'package:food_odering_app/data/food_data.dart';
import 'package:food_odering_app/models/food_model.dart';
import 'package:food_odering_app/pages/dashboard_pages/food_details_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/oders_page.dart';
import 'package:food_odering_app/pages/oders/oders_page1.dart';
import 'package:food_odering_app/pages/oders/oders_page2.dart';
import 'package:food_odering_app/pages/oders/oders_page3.dart';
import 'package:food_odering_app/widgets/food_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get food data
  final foodList = FoodData().foodList;

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
            Text(
              'Meals',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            // Food Cards
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  FoodModel food = foodList[index];
                  if (food.isMeal == true) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(
                              foodId: food.foodId,
                            ),
                          ),
                        );
                      },
                      child: FoodCard(
                        image: food.foodImageUrl,
                        name: food.foodName,
                        location: food.location,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),

            SizedBox(height: 15),
            Text(
              'Soft Drinks',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  FoodModel food = foodList[index];
                  if (food.isMeal == false) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(
                              foodId: food.foodId,
                            ),
                          ),
                        );
                      },
                      child: FoodCard(
                        image: food.foodImageUrl,
                        name: food.foodName,
                        location: food.location,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
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
                  name: 'Ambrosia Hotel & Restaurant',
                  location: 'Ambrosia Hotel & Restaurant',
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
                  name: 'Tava Restaurant',
                  location: 'Tava Restaurant',
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
                  name: 'Culinary Canva Café',
                  location: 'Culinary Canva Café',
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
                  }, // Ensure onTap is not null
                ),
              ],
            )
          ],
        ),
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
