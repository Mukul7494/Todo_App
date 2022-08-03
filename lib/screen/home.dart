import 'package:flutter/material.dart';
import 'package:todo_app/widget/addTodoDailogWidget.dart';
// import 'package:todo_app/widget/todo_dailog.dart';

import '../widget/todo_dailog.dart';
import '../widget/todo_list_widget.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  String input = "";
  String title = "";

  List<String> info = [];

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Data Eater",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        backgroundColor: Colors.amber,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        backgroundColor: Colors.amber,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDailogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
      
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showDialog(
//             builder: (context) => const AddTodoDailog(),
//             context: context,
//             barrierDismissible: false),
//         child: const Icon(Icons.add),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5),
//         child: ListView.builder(
//             itemCount: info.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Dismissible(
//                   key: Key(info[index]),
//                   child: Card(
//                     elevation: 5,
//                     margin: const EdgeInsets.all(8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         info[index],
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete_forever_rounded),
//                         onPressed: () {
//                           setState(() {
//                             info.removeAt(index);
//                           });
//                         },
//                       ),
//                     ),
//                   ));
//             }),
//       ),
//     );
//   }
// }
