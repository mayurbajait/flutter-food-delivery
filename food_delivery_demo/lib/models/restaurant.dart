import 'food_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String image;
  final String cuisine;
  final List<FoodItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.cuisine,
    required this.menu,
  });
}
