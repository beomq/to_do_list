import 'package:flutter/material.dart';
import 'package:to_do_list/create_screen.dart';
import 'package:to_do_list/model/todo.dart';

import 'main.dart';
import 'todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView(
        children: todos.values
            .map(
              (e) => TodoItem(
                todo: e,
                onTap: (todo) async {
                  todo.isDone = !todo.isDone;
                  await todo.save();

                  setState(() {});
                },
                onDelete: (todo) async {
                  await todo.delete();
                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
