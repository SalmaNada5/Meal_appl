import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.id,
      required this.imgUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);
  String get complexityType {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.challenging:
        return 'challenging';
      case Complexity.hard:
        return 'hard';
      default:
        return 'unknown';
    }
  }

  String get affordabilityType {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.pricey:
        return 'pricey';
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'unknown';
    }
  }

  selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white,
      onTap: () => selectMeal(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: FadeInImage(
                    image: NetworkImage(imgUrl),
                    placeholder: const AssetImage('assets/images/loading.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work_outline_outlined,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(complexityType),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityType),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
