import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  String title = "";

  List<String> info = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Data Eater",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Add Information"),
                content: TextField(
                  decoration: const InputDecoration(
                    hintText: "Add info",
                  ),
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          info.add(input);
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text("Add"))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: info.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(info[index]),
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        info[index],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          setState(() {
                            info.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
