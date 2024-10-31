import 'package:flutter/material.dart';
import '../models/recipe.dart';


class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(recipe.imgUrl),
             Padding(
              padding: const  EdgeInsets.all(16),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   recipe.name,
                   style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

                 ),
                 const SizedBox(height: 10,),

                 Text(
                   recipe.description,
                   style:const  TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold
                   ),
                 ),
                 const SizedBox(height: 10,),

                const  Text(
                   "Ingredients:",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                 ),

                 ...recipe.ingredients.map((ingredient)=>Padding(
                   padding: const EdgeInsets.symmetric(vertical: 4),
                   child: Text(ingredient, style:const  TextStyle(fontSize: 16),),
                 ))
               ],
             ),
            ),
          ],
        ),
      ),
    );
  }
}
