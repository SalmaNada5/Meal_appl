import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = 'CatScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
          title: const Text(
            'CATEGORIES',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            children: categories
                .map((c) => CategoryItem(
                      id: c.id,
                      title: c.title,
                      img: c.img,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
