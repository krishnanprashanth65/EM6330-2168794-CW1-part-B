import 'package:flutter/material.dart';
import 'package:mobappdev_coursework_1_part_b/Components/ToDoListWidget.dart';
import 'package:mobappdev_coursework_1_part_b/Controller/HomeController.dart';
import 'package:mobappdev_coursework_1_part_b/Model/TileCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<TileCard> todoList= [];
  void _incrementCounter() {
    setState(() {

    });
  }
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add new task.'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:  InputDecoration(hintText: "Task description."),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {

                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('ADD'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    var homeControllerObj = HomeController();
                    todoList.add(homeControllerObj.addTileCard(codeDialog));
                    _textFieldController.clear();
                    print(todoList);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }


  late String codeDialog;
  late String valueText;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title, style: const TextStyle(fontFamily: 'Dancing Script', fontSize: 25.0))),


      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ToDoListWidget(items: todoList),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  (){
          _displayTextInputDialog(context);
        },
        tooltip: 'ADD',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




