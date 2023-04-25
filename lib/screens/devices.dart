import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timebox/code.services/api.dart';
import '../providers/box_provider.dart';
import '../widgets/square_box.dart';

class Devices extends StatefulWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1), () {
      loadData();
    });
  }

  List<dynamic> _data = [];
  Future<void> loadData() async {
    var api = API();
    var response = await api.get('timebox');

    setState(() {
      _data = response.data["records"];
    });
  }

  Future<dynamic> addBox(name) async {
    var api = API();
    var response = await api.post('timebox', {"name": name});
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController deviceController = TextEditingController();

    Future<String> seachDevices =
        Future.delayed(const Duration(milliseconds: 2500), () {
      return "finished";
    });

    var foundBoxes = [
      "new box 1",
      "new box 2",
    ];

    skeleton() {
      return const Center(
          child: Text("Click on the plus icon to add a device"));
    }

    showDataAlert({required Function(dynamic data) onDataChanged}) {
      showDialog(
          context: context,
          builder: (context) {
            String selectedDevice = '';
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  top: 10.0,
                ),
                title: const Text(
                  "Setup new TimeBox",
                  style: TextStyle(fontSize: 24.0),
                ),
                content: SizedBox(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FutureBuilder<String>(
                          future: seachDevices, // a Future<String> or null
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Column(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        "assets/unbox.gif",
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                    const Text("looking for devices")
                                  ],
                                );
                              default:
                                return selectedDevice == ''
                                    ? SizedBox(
                                        height:
                                            200.0, // Change as per your requirement
                                        width:
                                            300.0, // Change as per your requirement
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 2,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              elevation: 2,
                                              color: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                onTap: () {
                                                  setState(() {
                                                    selectedDevice =
                                                        foundBoxes[index];

                                                    deviceController.text =
                                                        foundBoxes[index];
                                                  });
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                        foundBoxes[index])),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              autofocus: true,
                                              controller: deviceController,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText:
                                                      'Enter device name here'),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                var box = await addBox(
                                                    deviceController.text);
                                                onDataChanged(box);
                                                Navigator.of(context).pop();
                                                deviceController.clear();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                // fixedSize: Size(250, 50),
                                              ),
                                              child: const Text(
                                                "Add device",
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          });
    }

    return Consumer<TimeBoxState>(builder: (context, state, child) {
      Future<void> pullRefresh() async {}

      return Scaffold(
        body: RefreshIndicator(
          onRefresh: pullRefresh,
          child: _data.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(top: 30),
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SquareBox(
                        box: Box(_data[index]["data"]["name"]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 100, height: 40);
                  },
                )
              : skeleton(),
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('addItem_floatingActionButton'),
          onPressed: () {
            seachDevices =
                Future.delayed(const Duration(milliseconds: 2500), () {
              return "finished";
            });
            showDataAlert(onDataChanged: (box) {
              setState(() {
                _data.add(box);
              });
            });
          },
          tooltip: 'Add Item',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

class TimeBox {
  String? _id;
  String? user;
  Object? data;
}
