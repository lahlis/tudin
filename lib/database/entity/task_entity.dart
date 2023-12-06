import 'package:floor/floor.dart';
import 'package:tudin/enum/category.dart';
import 'package:tudin/enum/priority.dart';

import '../../model/list_item_model.dart';

@Entity(tableName: "task")
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String description;
  final Category category;
  final String date;
  final Priority priority;
  final bool isComplete;

  TaskEntity({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.date,
    required this.priority,
    required this.isComplete,
  });

  factory TaskEntity.fromModeltoEntity(ListItemModel model) => TaskEntity(
        id: model.id,
        name: model.name,
        description: model.description,
        category: model.category,
        date: model.date,
        priority: model.priority,
        isComplete: model.isComplete,
      );
}
