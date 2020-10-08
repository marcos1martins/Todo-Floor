import 'package:flutter/material.dart';
import 'package:todo_floor/db/database.dart';
import 'package:todo_floor/entities/todo_entitye.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.db, this.todo}) : super(key: key);
  final TodoEntity todo;
  final AppDatabase db;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var _titleController;

  var _anotationController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text: widget.todo != null ? widget.todo.title : "");
    _anotationController = TextEditingController(
        text: widget.todo != null ? widget.todo.anotation : "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _titleController,
          cursorColor: Colors.white54,
          showCursor: true,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            hintText: "Título",
            border: InputBorder.none,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white54),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        actions: [
          widget.todo != null
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.db.todoRepositoryDao.deleteItem(widget.todo);
                    Navigator.pop(context, true);
                  },
                )
              : Container()
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _anotationController,
              decoration: InputDecoration(
                  hintText: "Anotação", border: InputBorder.none),
              maxLines: 8,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          if (_titleController.text.isNotEmpty &&
              _anotationController.text.isNotEmpty) {
            var todo = TodoEntity(
              id: widget.todo != null ? widget.todo.id : null,
              anotation: _anotationController.text,
              title: _titleController.text,
              createdAt: DateTime.now().toUtc().toIso8601String(),
            );
            if (widget.todo != null) {
              widget.db.todoRepositoryDao.updateItem(todo);
            } else {
              widget.db.todoRepositoryDao.insertItem(todo);
            }
            Navigator.pop(context, true);
          }
        },
      ),
    );
  }
}
