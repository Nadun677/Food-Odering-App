import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> orders = [
    {"name": "Ambrosia Hotel & Resturant", "location": "Kandy", "rating": 4.7, "image": "assets/images/ambrosia-the-multicuisine-restaurant-ellis-bridge-ahmedabad-punjabi-restaurants-268nkyu.avif"},
    {"name": "Tava Resturant", "location": "Kandy", "rating": 4.7, "image": "assets/images/images.jpeg"},
    {"name": "Java Junction", "location": "Kandy", "rating": 4.7, "image": "assets/images/images.png"},
    {"name": "Ambrosia Hotel & Resturant", "location": "Kandy", "rating": 4.7, "image": "assets/images/ambrosia-the-multicuisine-restaurant-ellis-bridge-ahmedabad-punjabi-restaurants-268nkyu.avif"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildOrderList() {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
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
                    order['image'],
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
                      Text(order['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text(order['location']),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 4),
                          Text(order['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Check"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: "Coming"),
              Tab(text: "History"),
              Tab(text: "Cancelled"),
              Tab(text: "Draft"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildOrderList(),
                Center(child: Text("No History Orders")),
                Center(child: Text("No Cancelled Orders")),
                Center(child: Text("No Draft Orders")),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(padding: EdgeInsets.all(14), side: BorderSide(color: Colors.green)),
              icon: Icon(Icons.add, color: Colors.green),
              label: Text("Booking more", style: TextStyle(color: Colors.green, fontSize: 16)),
            ),
          ),
        ],
      ),
      
    );
  }
}
