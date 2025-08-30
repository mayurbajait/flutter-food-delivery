import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartScreen())),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurant.menu.length,
        itemBuilder: (ctx, i) {
          final item = restaurant.menu[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(item.image, width: 60, fit: BoxFit.cover),
              title: Text(item.name),
              subtitle: Text("\$${item.price}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .removeItem(item),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(item),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
