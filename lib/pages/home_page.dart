import 'package:flutter/material.dart';
import 'package:tudin/model/list_item_model.dart';

import 'package:tudin/repository/task_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.username,
    required this.repository,
  });

  final String username;
  final TaskRepository repository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 225, 83, 130),
      Colors.amber,
      Colors.blue,
    ],
  ).createShader(const Rect.fromLTWH(130.0, 130.0, 140.0, 20.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tu-Din',
          style: TextStyle(
              fontFamily: "Agbalumo",
              fontSize: 42,
              foreground: Paint()..shader = linearGradient),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: Colors.red[300],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      radius: 35,
                      child: Image.asset('assets/images/profile.png')),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá,',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          //fontFamily: "Agbalumo",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[300]),
                    ),
                    Text(
                      '${widget.username}!',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Tarefas recentes',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<ListItemModel>>(
              future: widget.repository.fetchAllTask(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        widget.repository.fetchAllTask().then((_) {
                          setState(() {});
                        });
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final ListItemModel element = snapshot.data![index];
                          return SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: element.priority.color,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          element.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          element.date,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      element.description,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Categoria:',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          element.category.name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: element.category.color,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Prioridade:',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              element.priority.name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        InkWell(
                                          child: Icon(Icons.delete_outline),
                                          onTap: () async {
                                            if (element.id != null) {
                                              await widget.repository
                                                  .deleteTask(element.id!);
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          "Sem tarefas no momento! Clique no botão abaixo para criar uma nova tarefa :)",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red[300],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
