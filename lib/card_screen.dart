import 'package:flutter/material.dart';
import 'package:srm_mess/messFood.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.time});

  final String time;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<String> daysOfWeek = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday'
  ];
  late Future<Map<String, dynamic>>? futureMenu;

  @override
  void initState() {
    super.initState();
    futureMenu = MessService().gpMenu();
    // print("\nfuture menu=$futureMenu");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureMenu,
          builder: (context, snapshot) {
            Map<String, dynamic> messMenu =
                snapshot.data ?? {"data": "no data"};
            // print("\n day: $currentDay\n time: ${widget.time} \n menu: ${messMenu[daysOfWeek[currentDay - 1]]}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Column(
                children: [
                  CircularProgressIndicator(),
                  Text("ERROR: No Net"),
                ],
              );
            } else if (snapshot.hasData) {
              return ListViewBuilder(
                  messMenu: messMenu, daysOfWeek: daysOfWeek, widget: widget);
            } else {
              return const Text("No Data");
            }
          },
        ),
      ),
    );
  }
}

// builder for making CARDS
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.messMenu,
    required this.daysOfWeek,
    required this.widget,
  });

  final Map<String, dynamic> messMenu;
  final List<String> daysOfWeek;
  final CardScreen widget;

  @override
  Widget build(BuildContext context) {
    var items = messMenu[daysOfWeek[currentDay - 1]][widget.time];
    // print("\nitem count = ${items.length}");
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var foodItem = items[index];
        // print("\n $foodItem");
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 5,
            color: Colors.lightGreenAccent,
            child: InkWell(
              onTap: () {
                print("$foodItem card tapped");
              },
              child: ListTile(
                title: Center(child: Text("$foodItem")),
              ),
            ),
          ),
        );
      },
    );
  }
}
