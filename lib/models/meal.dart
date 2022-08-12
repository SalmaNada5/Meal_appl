enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String? id;
  final String? title;
  final String? imgUrl;
  final List<String>? ingredients;
  final List<String>? steps;
  final List<String>? categories;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final bool? isVegan;
  final bool? isVegetarian;

  const Meal({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.ingredients,
    required this.categories,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
