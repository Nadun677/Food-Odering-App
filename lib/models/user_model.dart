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
}
