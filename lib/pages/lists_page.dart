import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tudin/enum/category.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var dateController = TextEditingController();

  Category _categories = Category.compras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: const Text(
          'Categorias',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 600,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Adicionar lista',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nome:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Expanded(child: TextField()),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text('Categoria:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                spacing: 10.0,
                                children: [
                                  ChoiceChip(
                                    selectedColor: Colors.amber,
                                    label: const Text(
                                      'Compras',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    selected: _categories == Category.compras,
                                    onSelected: (selected) {
                                      setState(() {
                                        _categories = Category.compras;
                                      });
                                    },
                                  ),
                                  ChoiceChip(
                                    selectedColor: Colors.pink,
                                    label: const Text(
                                      'Casa',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    selected: _categories == Category.casa,
                                    onSelected: (selected) {
                                      setState(() {
                                        _categories = Category.casa;
                                      });
                                    },
                                  ),
                                  ChoiceChip(
                                    selectedColor: Colors.purple,
                                    label: const Text(
                                      'Estudos',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    selected: _categories == Category.estudos,
                                    onSelected: (selected) {
                                      setState(() {
                                        _categories = Category.estudos;
                                      });
                                    },
                                  ),
                                  ChoiceChip(
                                    selectedColor: Colors.blue,
                                    label: const Text(
                                      'Saúde',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    selected: _categories == Category.saude,
                                    onSelected: (selected) {
                                      setState(() {
                                        _categories = Category.saude;
                                      });
                                    },
                                  ),
                                  ChoiceChip(
                                    selectedColor: Colors.green,
                                    label: const Text(
                                      'Trabalho',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    selected: _categories == Category.trabalho,
                                    onSelected: (selected) {
                                      setState(() {
                                        _categories = Category.trabalho;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Text('Data:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                          SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      style: const TextStyle(fontSize: 18),
                                      controller: dateController,
                                      readOnly: true,
                                      onTap: () async {
                                        var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2040, 12, 31),
                                        );
                                        if (date != null) {
                                          final String dateFormatted =
                                              DateFormat("dd/MM/yyyy")
                                                  .format(date);
                                  
                                          dateController.text = dateFormatted;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(14),
                                      backgroundColor: const Color.fromARGB(
                                          255, 225, 83, 130),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Criar',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Compras',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: const [
                Card(color: Colors.amber),
                Card(color: Colors.amber),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Casa',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: const [
                Card(color: Colors.pink),
                Card(color: Colors.pink),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Estudos',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: const [
                Card(color: Colors.purple),
                Card(color: Colors.purple),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Saúde',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: const [
                Card(color: Colors.indigo),
                Card(color: Colors.indigo),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Trabalho',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: const [
                Card(color: Colors.green),
                Card(color: Colors.green),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
