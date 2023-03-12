import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screens/planets.dart';
import '../screens/devices.dart';
import '../screens/history.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/settings.dart';

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
      label: 'test',
      icon: Icons.home_filled,
    ),
    ListItem(
      label: 'home',
      icon: Icons.timelapse_sharp,
    ),
    ListItem(
      label: 'history',
      icon: Icons.bar_chart,
    ),
    ListItem(
      label: 'devices',
      icon: Icons.dashboard_customize_sharp,
    ),
    ListItem(
      label: 'profile',
      icon: Icons.person,
    ),
    ListItem(
      label: 'settings',
      icon: Icons.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        backgroundColor: const Color(0xff303030),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: const Color(0xFF5A5A5A),
          title: const Text(
            'TIME:BOX',
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
            Planets(),
            Home(),
            History(),
            Devices(),
            Profile(),
            Settings(),
          ],
        ),
        bottomNavigationBar: Container(
            margin:
                const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 10),
            width: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                color: const Color(0xffB5B5B5),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GNav(
                        duration: Duration.zero,
                        color: Colors.black,
                        activeColor: Colors.black,
                        tabBackgroundColor: Colors.white,
                        selectedIndex: selectedIndex,
                        tabBorderRadius: 5,
                        onTabChange: onItemTapped,
                        //backgroundColor: const Color(0xFFB5B5B5),
                        padding:
                            const EdgeInsets.all(5), // navigation bar padding
                        tabs: pages.map((page) {
                          return GButton(icon: page.icon);
                        }).toList())),
              ),
            ) // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
