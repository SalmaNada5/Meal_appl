import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'MealScreen';
  final List<Meal> availableMeals;

  const CategoryMealScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final catTitle = routeArguments['title'];
    final catId = routeArguments['id'];
    final catMeals = widget.availableMeals.where(
      (meal) {
        return meal.categories!.contains(catId);
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          catTitle!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            letterSpacing: 2,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: catMeals.length,
          itemBuilder: (_, index) {
            return MealItem(
              id: catMeals[index].id!,
              imgUrl: catMeals[index].imgUrl!,
              title: catMeals[index].title!,
              duration: catMeals[index].duration!,
              complexity: catMeals[index].complexity!,
              affordability: catMeals[index].affordability!,
            );
          }),
    );
  }
}
