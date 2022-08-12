import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Container(
              color: Colors.orangeAccent,
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Cooking up!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            BuildListTile(
              icon: Icons.restaurant,
              title: 'Meals',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            BuildListTile(
                icon: Icons.settings,
                title: 'Filters',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 20,
        width: 20,
        child: Icon(
          icon,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
