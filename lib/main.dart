import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = meals;
  final List<Meal> _favoriteMeals = [];
  _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = meals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree!) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan!) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  _addToFav(String mealId) {
    final mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (mealIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, filters: _filters),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(addToFav: _addToFav, isFavorite: isFavorite),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CategoriesScreen(),
      ),
    );
  }
}
