import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tudin/database/dao/task_dao.dart';
import 'dart:async';

import 'package:tudin/database/entity/task_entity.dart';
import 'package:tudin/enum/category.dart';
import 'package:tudin/enum/priority.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [TaskEntity],
)

abstract class AppDatabase extends FloorDatabase{
  TaskDao get taskDao;
}