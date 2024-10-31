import 'package:flutter/material.dart';
// import '../models/recipe.dart';
import '../data/recipe_data.dart';
import '../screens/recipe_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: const Text("Recipe App"),),
      body: ListView.builder(
itemCount: recipes.length,
          itemBuilder: (context, index){
  final recipe=recipes[index];
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>RecipeDetails(recipe: recipe))
      );
    },
    child: SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(8),

        child: Column(
          children: [
            Image.network(recipe.imgUrl,
              width: 300,
              height: 250,
              fit: BoxFit.cover,),
            const SizedBox(height: 5),
            Padding(padding: const  EdgeInsets.all(16),
            child: Text(recipe.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            )
          ],
        ),
      ),
    ),
  );
          },


      ),

    );
  }
}
