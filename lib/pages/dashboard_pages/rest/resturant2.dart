import 'package:flutter/material.dart';
import 'package:food_odering_app/pages/table_availability_page.dart';

class RestaurantDetailsScreen3 extends StatelessWidget {
  const RestaurantDetailsScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Restaurant Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/9ecb7138-632c-478d-9d17-d55ce3f07f91.jpg', // Replace with real image URL
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Restaurant Name & Rating
              Text(
                'Culinary Canva CAfe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Text(
                    '4.8 (500 Feedbacks)',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Description Section
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'At Culinary Canva Café, the inviting aroma of freshly brewed coffee lingers in the air, mingling with the soothing hum of friendly conversations. Sunlight filters through large windows, casting a golden glow over the cozy wooden interiors. Every corner whispers warmth and comfort, making it the perfect escape from the citys hustle a place where every sip, every bite, feels like a moment of pure indulgence..',
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 16),

              // Facilities Section
              Text(
                'Facilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  FacilityItem(icon: Icons.local_cafe, label: 'Fast Service'),
                  FacilityItem(icon: Icons.car_repair, label: 'Parking'),
                  FacilityItem(icon: Icons.wc, label: 'Woshroom'),
                  FacilityItem(icon: Icons.water_drop, label: '24/7 Water Facility'),
                ],
              ),
              SizedBox(height: 16),

              // Best Offers Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Offers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
                ],
              ),

              // Placeholder for Offers
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'No Offers Available Today',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
          ),
          
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TableAvailabilityPage(),
              ),
            );
          },
          
          child: Text(
            'View Available Tables',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

// Facility Item Widget
class FacilityItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FacilityItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
