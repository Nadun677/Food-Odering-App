import 'package:food_odering_app/models/food_model.dart';

class CartItem {
  final FoodModel food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}

class Cart {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(FoodModel food) {
    var existingItem = _items.firstWhere(
      (item) => item.food.foodId == food.foodId,
      orElse: () => CartItem(food: food, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(food: food, quantity: 1));
    }
  }

  void removeFromCart(String foodId) {
    _items.removeWhere((item) => item.food.foodId == foodId);
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.food.foodPrice * item.quantity));

  void clearCart() {
    _items.clear();
  }
}
