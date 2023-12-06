import 'package:floor/floor.dart';
import 'package:tudin/database/entity/task_entity.dart';

@dao
abstract class TaskDao{
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTask(TaskEntity entity);

  @Query("""
    SELECT *
    FROM task
  """  
  )
  Future<List<TaskEntity>> fetchAllTask();
  
  @Query("""
    DELETE
    FROM task
    WHERE id = :id
  """)
  Future<void> deleteTask(int id);

}