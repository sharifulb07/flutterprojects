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
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: black))),
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
                    hintStyle: TextStyle(fontSize: 12),
                    prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 42,
                      minWidth: 42,
                    ),
                    fillColor: white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primary))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.arrowDown),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      iconSize: 18,
                      color: gray700,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DropdownButton(
                        value: dropdownValue,
                        icon: FaIcon(
                          FontAwesomeIcons.arrowDownWideShort,
                          size: 18,
                          color: gray700,
                        ),
                        underline: SizedBox.shrink(),
                        borderRadius: BorderRadius.circular(16),
                        isDense: true,
                        items: dropdownOptions
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Row(children: [
                                    Text(e),
                                    if (e == dropdownValue) ...[
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(Icons.check),
                                    ]
                                  ]),
                                ))
                            .toList(),
                        selectedItemBuilder: (context) =>
                            dropdownOptions.map((e) => Text(e)).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.bars),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      iconSize: 18,
                      color: gray700,
                    ),
                  ],
                ),
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
