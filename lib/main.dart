import 'dart:io';

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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
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
  List<String> time = ["BREAKFAST", "LUNCH", "EVENING SNACKS", "DINNER"];

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 2,
      // animationDuration: const Duration(milliseconds: 500),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.greenAccent,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  decreaseDay();
                });
              },
            ),
            Text(days[currentDay - 1].substring(0, 3),
                style: const TextStyle(color: Colors.white)),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.greenAccent,
                size: 30
              ),
              onPressed: () {
                setState(() {
                  increaseDay();
                });
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("SRM GP Mess",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              )),
          bottom: TabBar(
            onTap: (index){
              setState(() {
              _currentIndex=index;
              });
            },
            unselectedLabelColor: Colors.white60,
            labelColor: Colors.yellowAccent,
            tabs: const [
              Tab(icon: Icon(Icons.sunny)),
              Tab(icon: Icon(Icons.food_bank)),
              Tab(icon: Icon(Icons.coffee)),
              Tab(icon: Icon(Icons.nightlight)),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            CardScreen(time: time[_currentIndex]),
            CardScreen(time: time[_currentIndex]),
            CardScreen(time: time[_currentIndex]),
            CardScreen(time: time[_currentIndex]),
          ],
        ),
        drawer: const Sidebar(),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
