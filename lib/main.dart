import 'package:flutter/material.dart';
import 'package:todo_floor/db/database.dart';
import 'package:todo_floor/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      db: await $FloorAppDatabase.databaseBuilder('app_database.db').build(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.db}) : super(key: key);
  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(db: db),
    );
  }
}
