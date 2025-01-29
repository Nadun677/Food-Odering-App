import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

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
                  'assets/images/70259830.webp', // Replace with real image URL
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Restaurant Name & Rating
              Text(
                'Tava Restaurant',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star_half, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Text(
                    '4.0 (999+ Feedbacks)',
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
                'The aroma of freshly brewed coffee filled the air, mingling with the soft chatter of patrons. Sunlight streamed through the large windows, illuminating the cozy cafe with a warm glow. It was the perfect place to escape the hustle and bustle of the city and enjoy a moment of tranquility.',
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
                  FacilityItem(icon: Icons.local_cafe, label: 'Snack Bar'),
                  FacilityItem(icon: Icons.directions_bike, label: 'Bikes & Parking'),
                  FacilityItem(icon: Icons.wc, label: 'Toilet'),
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
                  'Offers will be displayed here',
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
          onPressed: () {
            // Add booking functionality here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
          ),
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

  const FacilityItem({required this.icon, required this.label});

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
