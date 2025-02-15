// import 'package:flutter/material.dart';

// class BookingCard extends StatelessWidget {
//   final String name;
//   final String location;
//   final double rating;
//   final String image;
//   final Function() onTap;
  
//    const BookingCard({
//     super.key,
//     required this.name,
//     required this.location,
//     required this.rating,
//     required this.image,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.location_on, color: Colors.green),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   location,
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             rating.toString(),
//             style: TextStyle(
//               color: Colors.orange,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(width: 8),
//           ElevatedButton(
//             onPressed: onTap,
//             child: Text('Book'),
//           ),
//         ],
//       ),
//     );
//   }
// }