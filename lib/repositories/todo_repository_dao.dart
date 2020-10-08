import 'package:floor/floor.dart';
import 'package:todo_floor/entities/entitye_base.dart';
import 'package:todo_floor/entities/todo_entitye.dart';

import 'interfaces/repository_dao_interface.dart';

@dao
abstract class TodoRepositoryDao extends IRepositoryDaoInterface<TodoEntity> {
  @Query('SELECT * FROM Todos WHERE id = :id')
  Future<TodoEntity> getById(int id);

  @Query('SELECT * FROM Todos')
  Future<List<TodoEntity>> getAll();
}
