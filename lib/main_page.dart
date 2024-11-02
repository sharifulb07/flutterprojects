import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_notes_app/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ["Date Modified", "Date Created"];
  late String dropdownValue = dropdownOptions.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Notes 📄'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
            style: IconButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)              )
              
            ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {},
          child: FaIcon(FontAwesomeIcons.plus),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Search Notes.....",
                    prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.arrowDown)),
                  DropdownButton(
                      value: dropdownValue,
                      items: dropdownOptions
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      }),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.bars)),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 15,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Text("This is going to be little "),
                            Row(
                              children: [Text("First Chip")],
                            ),
                            Text("Some content"),
                            Row(
                              children: [
                                Text("04 November, 2023"),
                                FaIcon(FontAwesomeIcons.trash)
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
