import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final ImageProvider<Object>? img;
  const CategoryItem({Key? key, this.id, this.title, this.img})
      : super(key: key);

  void onTap(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.orangeAccent, width: 0.5),
      ),
      child: InkWell(
        onTap: () => onTap(context),
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: img!,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title!,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
