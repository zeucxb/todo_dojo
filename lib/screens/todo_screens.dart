import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class Todo {
  final int index;
  final String label;

  Todo(this.index, this.label);
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> myTodos = [];
  TextEditingController controller = new TextEditingController();
  int count = 0;

  deleteTodo(index) {
    setState(() {
      myTodos.removeWhere((element) => element.index == index);
    });
  }

  addTodo() {
    final text = controller.text;

    setState(() {
      if (text.isNotEmpty) {
        myTodos.add(Todo(count, text));
      }
    });

    controller.text = '';

    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Lindão')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Escreva seu TODO',
            ),
            controller: controller,
          ),
          Expanded(
            child: ListView(
              children: myTodos
                  .map(
                    (todo) => Dismissible(
                      onDismissed: (direction) {
                        deleteTodo(todo.index);
                      },
                      key: Key(todo.index.toString()),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.amber,
                        margin: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Todo: ${todo.label}'),
                            TextButton(
                              child: Icon(Icons.delete),
                              onPressed: () {
                                deleteTodo(todo.index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addTodo,
      ),
    );
  }
}
