import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../widgets/restaurant_card.dart';
import 'restaurant_detail_screen.dart';
import '../models/food_item.dart';

class HomeScreen extends StatelessWidget {
final List<Restaurant> restaurants = [
  Restaurant(
    id: '1',
    name: 'Pizza Palace',
    image: 'https://via.placeholder.com/300x200.png?text=Pizza+Palace',
    cuisine: 'Italian',
    menu: [
      FoodItem(
        id: 'f1',
        name: 'Margherita Pizza',
        price: 5.0,
        image: 'https://via.placeholder.com/150.png?text=Margherita',
      ),
      FoodItem(
        id: 'f2',
        name: 'Pepperoni Pizza',
        price: 7.0,
        image: 'https://via.placeholder.com/150.png?text=Pepperoni',
      ),
    ],
  ),
  Restaurant(
    id: '2',
    name: 'Sushi Spot',
    image: 'https://via.placeholder.com/300x200.png?text=Sushi+Spot',
    cuisine: 'Japanese',
    menu: [
      FoodItem(
        id: 'f3',
        name: 'Salmon Sushi',
        price: 8.0,
        image: 'https://via.placeholder.com/150.png?text=Salmon+Sushi',
      ),
      FoodItem(
        id: 'f4',
        name: 'Tuna Roll',
        price: 6.0,
        image: 'https://via.placeholder.com/150.png?text=Tuna+Roll',
      ),
    ],
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurants')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: restaurants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => RestaurantCard(
          restaurant: restaurants[i],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantDetailScreen(restaurant: restaurants[i]),
              ),
            );
          },
        ),
      ),
    );
  }
}
