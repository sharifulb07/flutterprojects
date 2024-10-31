import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<String> shoppingList = [];

  final TextEditingController _controller = TextEditingController();

  void addItem() {
    var item = _controller.text.trim();
    if (shoppingList.isEmpty) {
      setState(() {
        shoppingList.add(item);
      });
    }
    if (shoppingList.isNotEmpty) {
      setState(() {
        shoppingList.add(item);
      });
    }
    _controller.clear();
  }

  void removeItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: "Add item",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2.0, // Use a smaller width, 20 is very thick
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
                ],
              ),
            ),

           Expanded(
             child: ListView.builder(
                    itemCount: shoppingList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(shoppingList[index]),
                        leading: IconButton(
                            onPressed: () => removeItem(index),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      );
                    }),
           ),

          ],
        ),

    );
  }
}
