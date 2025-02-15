class FoodModel {
  final String foodId;
  final String foodName;
  final String foodImageUrl;
  final String foodDescription;
  final double foodPrice;
  final double foodRating;
  final String location;
  final bool isMeal;

  FoodModel({
    required this.foodId,
    required this.foodName,
    required this.foodImageUrl,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodRating,
    required this.location,
    required this.isMeal,
  });
}
