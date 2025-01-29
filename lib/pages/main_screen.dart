import 'package:flutter/material.dart';

import 'package:food_odering_app/widgets/side_menu.dart';

// dashboard pages
import 'package:food_odering_app/pages/dashboard_pages/favorite_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/home_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/oders_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/profile_page.dart';
import 'package:food_odering_app/pages/dashboard_pages/resturant.dart';
import 'package:food_odering_app/pages/dashboard_pages/cart_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // pages
  final List<Widget> _pages = [
    HomePage(),
    OdersPage(),
    RestaurantDetailsScreen(),
    CartScreen(),
    FavoritePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text('Hi Nadun! Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: SideMenu(),
      ),

      body: Stack(
        children: [
          _pages[_currentIndex],
        ],
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_restaurant),
            label: "Restaurant",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
          
        ],
      ),
    );
  }
}
