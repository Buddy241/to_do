import 'package:flutter/material.dart';


class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<String> _tasks = [];
  final TextEditingController _textController = TextEditingController();

  void _addTask() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: _tasks.isEmpty
          ? Center(child: Text('No tasks yet.'))
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_tasks[index]),
            onDismissed: (direction) {
              _removeTask(index);
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(_tasks[index]),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter task'),
              ),
            ),
            FloatingActionButton(
              onPressed: _addTask,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
