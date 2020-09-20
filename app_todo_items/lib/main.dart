import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          brightness: Brightness.light,
          primaryColor: Colors.purple,
          accentColor: Colors.blue),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add a item in TodoList"),
                content: TextField(
                  onChanged: (String inputValue) {
                    inputText = inputValue;
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        todos.add(inputText);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  )
                ],
              );
            },
          );
        },
        child: FaIcon(FontAwesomeIcons.plus, size: 20, color: Colors.white,)
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(todos[index]),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.trash, size: 20, color: Colors.red,),
                onPressed: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
