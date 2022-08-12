import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);
  final List favoriteMeals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'YOUR FAVORITES',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            letterSpacing: 2,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: favoriteMeals.isEmpty
          ? const Center(
              child: Text(
                'You have no favorites yet, start adding some!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (_, index) {
                return MealItem(
                  id: favoriteMeals[index].id!,
                  imgUrl: favoriteMeals[index].imgUrl!,
                  title: favoriteMeals[index].title!,
                  duration: favoriteMeals[index].duration!,
                  complexity: favoriteMeals[index].complexity!,
                  affordability: favoriteMeals[index].affordability!,
                );
              }),
    );
  }
}
