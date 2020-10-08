import 'package:flutter/material.dart';
import 'package:todo_floor/db/database.dart';
import 'package:todo_floor/entities/todo_entitye.dart';
import 'package:todo_floor/pages/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.db}) : super(key: key);
  final AppDatabase db;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text("Minhas anotações"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: FutureBuilder<List<TodoEntity>>(
          future: widget.db.todoRepositoryDao.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TodoPage(
                                db: widget.db,
                                todo: snapshot.data[index],
                              );
                            },
                          ),
                        );
                        if (result) {
                          setState(() {});
                        }
                      },
                      tileColor: Colors.amber[100],
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].anotation),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text("Não há anotações..."),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TodoPage(db: widget.db);
              },
            ),
          );
          if (result) {
            setState(() {});
          }
        },
      ),
    );
  }
}
