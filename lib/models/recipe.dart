

class Recipe {
  Recipe({
    required this.name,
    required this.imgUrl,
    required this.ingredients,
    required this.description,
  });

  final String name;
  final String imgUrl;
  final List<String> ingredients;
  final String description;
}
