import 'package:flutter/material.dart';
import '../screens/devices.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class Default extends StatefulWidget {
  const Default({Key? key}) : super(key: key);

  @override
  State<Default> createState() => _DefaultState();
}

class ListItem {
  IconData icon;
  String label;
  ListItem({
    this.label = '',
    this.icon = Icons.ac_unit_outlined,
  });
}

class _DefaultState extends State<Default> {
  int selectedIndex = 0;

  static List<ListItem> pages = [
    ListItem(
      label: 'home',
      icon: Icons.check_box_outline_blank_rounded,
    ),
    ListItem(
      label: 'chat',
      icon: Icons.add_box,
    ),
    ListItem(
      label: 'camera',
      icon: Icons.account_box,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: const Color(0xFF5A5A5A),
          title: const Text(
            'TIME BOX',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            Home(),
            Devices(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex, //New
          onTap: onItemTapped, //New
          backgroundColor: Colors.black,
          selectedFontSize: 20,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme:
              const IconThemeData(color: Colors.amberAccent, size: 40),
          selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          elevation: 0,
          items: pages.map((page) {
            return BottomNavigationBarItem(
                icon: Icon(
                  page.icon,
                  size: 30,
                ),
                label: page.label);
          }).toList(),
        ));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
