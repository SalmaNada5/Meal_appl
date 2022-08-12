import 'dart:ui';

import 'package:flutter/material.dart';
import '../data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {Key? key, required this.addToFav, required this.isFavorite})
      : super(key: key);
  static const routeName = 'meal_detail';
  final Function addToFav;
  final Function isFavorite;
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = meals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(selectedMeal.imgUrl!),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.6))),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      onTap: () => addToFav(mealId),
                      child: ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.6))),
                              child: isFavorite(mealId)
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.amber,
                                    )),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.black54,
                        ),
                        child: Text(
                          selectedMeal.title!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Raleway'),
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients!.length,
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  shadowColor: Colors.orangeAccent,
                  margin: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.orangeAccent,
                        width: 0.2,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients![index]),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                'Steps',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 0.4,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: Colors.orangeAccent,
                        child: Text(
                          '# ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps![index],
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 10,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
