import 'package:flutter/material.dart';
import 'package:tudin/database/entity/task_entity.dart';
import 'package:tudin/enum/category.dart';
import 'package:tudin/enum/priority.dart';

import 'package:tudin/model/list_item_model.dart';

import '../database/dao/task_dao.dart';

class TaskRepository {
  TaskRepository({
    required this.taskDao,
  });

  final TaskDao taskDao;

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();

  Category _categories = Category.compras;
  Priority _priorities = Priority.low;

  void setCategory(Category value) {
    _categories = value;
  }

  Category get actualCategory => _categories;

  void setPriority(Priority value) {
    _priorities = value;
  }

  Priority get actualPriority => _priorities;

  Future<void> createTask() async {
    final ListItemModel listItemModel = ListItemModel(
      name: nameController.text,
      description: descriptionController.text,
      category: _categories,
      date: dateController.text,
      priority: _priorities,
      isComplete: false,
    );

    await taskDao.insertTask(TaskEntity.fromModeltoEntity(listItemModel));
  }

  Future<void> deleteTask(int id) async{
    await taskDao.deleteTask(id);
  }

  
  Future<List<ListItemModel>> fetchAllTask() async {
    final List<TaskEntity> result = await taskDao.fetchAllTask();
    return result.map((e) => ListItemModel.fromEntityToModel(e)).toList();
  }

  void clearRepository() {
    nameController.clear();
    descriptionController.clear();
    dateController.clear();
    _priorities = Priority.low;
    _categories = Category.compras;
  }
}
