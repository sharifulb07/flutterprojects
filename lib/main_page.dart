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

  bool isDescending = false;

  bool isGrid = false;

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
                      onPressed: () {
                        setState(() {
                          isDescending = !isDescending;
                        });
                      },
                      icon: FaIcon(isDescending
                          ? FontAwesomeIcons.arrowDown
                          : FontAwesomeIcons.arrowUp),
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
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      },
                      icon: FaIcon(isGrid
                          ? FontAwesomeIcons.tableCellsLarge
                          : FontAwesomeIcons.bars),
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
                child: isGrid ? const NotesGrid() : const NotesList(),
              )
            ],
          ),
        ));
  }
}

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        itemCount: 15,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
      return NoteCard(
        isInGrind: false,
      );
    },
      separatorBuilder: (context,index)=>const SizedBox(height: 8,),

    );
  }
}

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          return NoteCard(
            isInGrind: true,
          );
        });
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.isInGrind});

  final bool isInGrind;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: white,
          border: Border.all(color: primary.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.5),
              offset: Offset(4, 4),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is going to be little ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: gray900),
          ),
          SizedBox(
            height: 4,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    3,
                    (index) => Container(
                          decoration: BoxDecoration(
                              color: gray100,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          child: Text(
                            "First Chip",
                            style: TextStyle(fontSize: 12, color: gray700),
                          ),
                          margin: const EdgeInsets.only(right: 8),
                        ))),
          ),
          SizedBox(
            height: 4,
          ),
          isInGrind?
            Expanded(
                child: Text(
              "Some content",
              style: TextStyle(color: gray700),
            ))
         :
            Text(
              "Some content",
              style: TextStyle(color: gray700),
            ),
          Row(
            children: [
              Text(
                "04 November, 2023",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: gray500),
              ),
              Spacer(),
              FaIcon(
                FontAwesomeIcons.trash,
                size: 16,
                color: gray500,
              )
            ],
          )
        ],
      ),
    );
  }
}
