import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tudin/enum/category.dart';
import 'package:tudin/enum/priority.dart';
import 'package:tudin/repository/task_repository.dart';

class CreationPage extends StatefulWidget {
  CreationPage({super.key, required this.repository});

  final TaskRepository repository;

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.red[100],
        title: const Text(
          'Criar tarefa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nome:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
                maxLength: 30,
                controller: widget.repository.nameController,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Descrição:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: widget.repository.descriptionController,
                maxLines: 2,
                maxLength: 60,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Categoria:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  ChoiceChip(
                    selectedColor: Category.compras.color,
                    label:  Text(
                      Category.compras.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected:
                        widget.repository.actualCategory == Category.compras,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setCategory(Category.compras);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Category.casa.color,
                    label:  Text(
                      Category.casa.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected: widget.repository.actualCategory == Category.casa,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setCategory(Category.casa);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Category.estudos.color,
                    label:  Text(
                      Category.estudos.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected:
                        widget.repository.actualCategory == Category.estudos,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setCategory(Category.estudos);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Category.saude.color,
                    label:  Text(
                      Category.saude.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected:
                        widget.repository.actualCategory == Category.saude,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setCategory(Category.saude);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Category.trabalho.color,
                    label:  Text(
                      Category.trabalho.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected:
                        widget.repository.actualCategory == Category.trabalho,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setCategory(Category.trabalho);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Data prevista para conclusão:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: const TextStyle(fontSize: 18),
                controller: widget.repository.dateController,
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
                        DateFormat("dd/MM/yyyy").format(date);

                    widget.repository.dateController.text = dateFormatted;
                  }
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              const Text('Prioridade:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  ChoiceChip(
                    selectedColor: Priority.low.color,
                    label: Text(
                      Priority.low.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected: widget.repository.actualPriority == Priority.low,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setPriority(Priority.low);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Priority.medium.color,
                    label: Text(
                      Priority.medium.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected:
                        widget.repository.actualPriority == Priority.medium,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setPriority(Priority.medium);
                      });
                    },
                  ),
                  ChoiceChip(
                    selectedColor: Priority.high.color,
                    label: Text(
                      Priority.high.name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    selected: widget.repository.actualPriority == Priority.high,
                    onSelected: (selected) {
                      setState(() {
                        widget.repository.setPriority(Priority.high);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: const Color.fromARGB(255, 225, 83, 130),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    widget.repository.createTask().then((value) {
                      widget.repository.clearRepository();
                     
                      Navigator.pop(context);
                       setState(() {
                        
                      });
                    });
                  },
                  child: const Text(
                    'Criar nova tarefa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
