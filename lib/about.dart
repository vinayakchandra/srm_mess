import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String _email = "vinayak.chandra.suryavanshi@gmail.com";

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('😎', style: TextStyle(fontSize: 100)),
          const Text(
            'This App is made by Vinayak',
            style: TextStyle(fontSize: 20),
          ),
          InkWell(
            child: Text(
              _email,
              style: const TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
