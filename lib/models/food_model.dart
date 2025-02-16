class FoodModel {
  final String foodId;
  final String foodName;
  final String foodImageUrl;
  final String foodDescription;
  final double foodPrice;
  final double foodRating;
  final String location;
  final bool isMeal;
  int quantity;
  double spiciness;

  FoodModel({
    required this.foodId,
    required this.foodName,
    required this.foodImageUrl,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodRating,
    required this.location,
    required this.isMeal,
    this.quantity = 1,
    this.spiciness = 0.0,
  });

  // Add copyWith method for cart modifications
  FoodModel copyWith({
    int? quantity,
    double? spiciness,
  }) {
    return FoodModel(
      foodId: foodId,
      foodName: foodName,
      foodImageUrl: foodImageUrl,
      foodDescription: foodDescription,
      foodPrice: foodPrice,
      foodRating: foodRating,
      location: location,
      isMeal: isMeal,
      quantity: quantity ?? this.quantity,
      spiciness: spiciness ?? this.spiciness,
    );
  }
}