import 'package:food_odering_app/models/food_model.dart';

class UserModel {
  final String userId;
  final String userFirstName;
  final String userLastName;

  final List<FoodModel> foodCartList;

  

  UserModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.foodCartList,
  });

  // add new food to the foodCartList
  void addFoodCart(FoodModel newItem) {
    // Check for existing items with same ID and spiciness level
    final existingIndex = foodCartList.indexWhere((item) => 
      item.foodId == newItem.foodId && 
      item.spiciness == newItem.spiciness);

    if (existingIndex != -1) {
      // Update quantity if exists
      foodCartList[existingIndex].quantity += newItem.quantity;
    } else {
      // Add new item to cart
      foodCartList.add(newItem);
    }
  }
}