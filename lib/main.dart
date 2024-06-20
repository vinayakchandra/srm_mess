import 'package:flutter/material.dart';
import 'package:srm_mess/messFood.dart';
import 'package:srm_mess/sideBar.dart';
import 'card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        // primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // animationDuration: const Duration(milliseconds: 500),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                print("left arrow pressed");
                setState(() {
                  decreaseDay();
                });
              },
            ),
            Text(days[currentDay - 1].substring(0, 3),
                style: const TextStyle(color: Colors.white)),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                print("right arrow pressed");
                setState(() {
                  increaseDay();
                });
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("SRM Mess"),
          bottom: const TabBar(
            unselectedLabelColor: Colors.white60,
            labelColor: Colors.yellowAccent,
            tabs: [
              Tab(icon: Icon(Icons.sunny)),
              Tab(icon: Icon(Icons.food_bank)),
              Tab(icon: Icon(Icons.coffee)),
              Tab(icon: Icon(Icons.nightlight)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CardScreen(time: "BREAKFAST"),
            CardScreen(time: "LUNCH"),
            CardScreen(time: "EVENING SNACKS"),
            CardScreen(time: "DINNER"),
          ],
        ),
        drawer: const Sidebar(),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
