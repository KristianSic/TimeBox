import 'package:flutter/material.dart';

class SettingsItem {
  String title;
  IconData icon;
  SettingsItem({required this.title, required this.icon});
}

class SettingsItemGroup {
  String title;
  List<SettingsItem> items;
  SettingsItemGroup({required this.title, required this.items});
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SettingsItemGroup> items = [
      SettingsItemGroup(title: "Account", items: [
        SettingsItem(title: 'Password and security', icon: Icons.password),
        SettingsItem(title: 'Logout', icon: Icons.logout),
      ]),
      SettingsItemGroup(title: "Preferences", items: [
        SettingsItem(title: 'Dark mode', icon: Icons.dark_mode),
      ]),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            // Get the current SettingsItemGroup from the list
            SettingsItemGroup itemGroup = items[index];

            // Build a list of ListTile widgets from the SettingsItem objects in the group
            List<Widget> listTiles = itemGroup.items.map((SettingsItem item) {
              return ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.only(left: 10),
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {},
              );
            }).toList();

            // Build a Card widget to display the group of settings items
            return Card(
              color: Colors.transparent,
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Text(itemGroup.title,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  ...listTiles // Spread the list of ListTile widgets into the column
                ],
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const Divider(thickness: 3, color: Color(0xffB5B5B5));
          },
          itemCount: items.length),
    );
  }
}
