import 'package:flutter/material.dart';
import 'package:tudin/pages/creation_page.dart';
import 'package:tudin/pages/home_page.dart';
import 'package:tudin/pages/lists_page.dart';
import 'package:tudin/repository/task_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.username, required this.repository 
  });

  final String username;
  final TaskRepository repository;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentPageIndex = 0;

  late List<Widget> pages = [
    HomePage(username: widget.username, repository: widget.repository,),
    const ListsPage(),
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreationPage(
                    repository: widget.repository,
                  )));
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.red[300],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[300],
        currentIndex: currentPageIndex,
        onTap: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Listas'),
          
        ]),
    );
  }
}