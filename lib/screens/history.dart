import 'package:flutter/material.dart';

import '../widgets/list_card.dart';

class ListItem {
  String title;
  String time;
  ListItem({
    this.title = '',
    this.time = '',
  });
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    List<ListItem> items = [
      ListItem(title: 'Pandora', time: '3:12'),
      ListItem(title: 'Pandora', time: '0:12'),
      ListItem(title: 'Alcatraz', time: '6:12'),
    ];
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Search...',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.manage_search,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.legend_toggle_sharp,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'History',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        return MyListWidget(
                          title: items[index].title,
                          time: items[index].time,
                          onShare: () {},
                          onDelete: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 100, height: 20);
                      },
                      itemCount: items.length),
                ),
              ],
            )));
  }
}
