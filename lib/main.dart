import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: notes() ,
));

class notes extends StatefulWidget {
  @override
  _notesState createState() => _notesState();
}

class _notesState extends State<notes> {

  List<String> todo = ['Do homework',
  'Type Something',
  'Learn Spanish'];
  String newItem = '';

  Widget listTemplate(item){
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: <Widget>[
          Text(
            item,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          FlatButton(
              child: Icon(Icons.remove_circle),
              onPressed: (){
                setState(() {
                  todo.remove(item);
                });
              },
          ),
        ],

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(5),


      ),
      color: Colors.grey[200],

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
        ),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            todo.add(newItem);
          });
        },
        child: Icon(Icons.add),

        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          children: <Widget>[
            Column(
            children: todo.map((item) => listTemplate(item)).toList(),

          ),
            TextField(
              onChanged: (text){
                setState(() {
                  newItem = text;
                });
              },
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
    ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
