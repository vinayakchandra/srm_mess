import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String title = "Pop";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      child: Drawer(
        backgroundColor: Colors.greenAccent,
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName: Text("Made by Vinayak"),
                accountEmail: Text("vinayak.chandra.suryavanshi@gmail.com")),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text("About", style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => About()));
                }),
            ListTile(
              tileColor: Colors.red,
              leading: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              title: const Text("EXIT",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                iosAlert(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  iosAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("EXIT?"),
        content: const Text("Are you sure you want to EXIT?"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text("YES", style: TextStyle(color: Colors.red)),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
