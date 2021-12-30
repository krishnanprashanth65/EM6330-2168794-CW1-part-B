import 'package:flutter/material.dart';
import 'package:mobappdev_coursework_1_part_b/Model/TileCard.dart';

//This is the main To-Do List Widget
class ToDoListWidget extends StatefulWidget {
  const ToDoListWidget({Key? key, required this.items}) : super(key: key);

  final List<TileCard> items;
  @override
  State<ToDoListWidget> createState() => _ToDoListWidgetState();
}


class _ToDoListWidgetState extends State<ToDoListWidget> {
  bool _isSelected = false;
  List<bool> boolitems = [];


  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.all(15),
      iconColor: Colors.red[500],
      textColor: Colors.black,
      tileColor: Colors.blue[100],
      style: ListTileStyle.list,
      dense: true,
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (_, index) => Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            onTap: (){
              setState(() {
                if(widget.items[index].ischecked == false){
                  widget.items[index].ischecked = true;

                }else{
                  widget.items[index].ischecked = false;

                }
              });
            },
            title: Text(widget.items[index].name, style: TextStyle(fontSize: 16.0,decoration: widget.items[index].ischecked ? TextDecoration.lineThrough : TextDecoration.none )),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  setState(() {
                    widget.items.removeAt(index);
                  });
                }, icon: Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}