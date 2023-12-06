import 'package:flutter/material.dart';
import 'package:tudin/database/app_database.dart';
import 'package:tudin/pages/welcome_page.dart';
import 'package:tudin/repository/task_repository.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder("task_database.db").build();

  final TaskRepository repository = TaskRepository(taskDao: database.taskDao);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});

  final TaskRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Baloo Da 2',       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home:  WelcomePage(repository: repository,),
    );
  }
}
