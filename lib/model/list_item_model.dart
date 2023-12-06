// ignore_for_file: public_member_api_docs, sort_constructors_first
//Model com as informações que desejo salvar sobre os itens

import 'package:tudin/database/entity/task_entity.dart';
import 'package:tudin/enum/category.dart';
import 'package:tudin/enum/priority.dart';

class ListItemModel {
  final int? id; //diferencia os itens entre si
  final String name;
  final String description;
  final Category category;
  final String date;
  final Priority priority;
  final bool isComplete;

  ListItemModel({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.date,
    required this.priority,
    required this.isComplete,
  });

  factory ListItemModel.fromEntityToModel(TaskEntity entity) => ListItemModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        category: entity.category,
        date: entity.date,
        priority: entity.priority,
        isComplete: entity.isComplete,
      );
}
