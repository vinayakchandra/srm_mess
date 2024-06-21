import 'package:flutter/material.dart';
import 'package:srm_mess/messFood.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.time});

  final String time;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    int relativeCrossAxisCount = MediaQuery.of(context).size.width ~/ 180;
    var messMenu = GPMess().menu()[currentDay - 1][widget.time];
    print("\n day: $currentDay\n time: ${widget.time} \n menu: $messMenu");

    return SafeArea(
      bottom: false,
      child: ListView.builder(
        itemCount: messMenu.length,
        itemBuilder: (context, index) {
          var foodItem = messMenu[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 5,
              color: Colors.lightGreenAccent,
              child: InkWell(
                onTap: () {
                  print("$foodItem card tapped");
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text("$foodItem"),
                    // trailing: SizedBox(
                    //   width: 70,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: IconButton(
                    //           icon: const Icon(Icons.thumb_up_outlined),
                    //           onPressed: () {
                    //             setState(() {
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: IconButton(
                    //           icon: const Icon(Icons.thumb_down_outlined),
                    //           onPressed: () {},
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
