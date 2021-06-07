import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Widget> myTodos = [];
  TextEditingController controller = new TextEditingController();
  int count = 0;

  deleteTodo(index) {
    setState(() {
      myTodos.removeAt(index);
    });
  }

  addTodo() {
    setState(() {
      myTodos.add(Container(
        child: Column(children: [
          Text('Todo ${controller.text}'),
          TextButton(
            child: Icon(Icons.delete),
            onPressed: () => deleteTodo(myTodos.length),
          ),
        ]),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Lindão')),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Container(
                padding: EdgeInsets.only(top: 12),
                child: Column(children: myTodos))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addTodo,
      ),
    );
  }
}
