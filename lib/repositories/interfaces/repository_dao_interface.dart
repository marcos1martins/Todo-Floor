import 'package:floor/floor.dart';
import 'package:todo_floor/entities/entitye_base.dart';

abstract class IRepositoryDaoInterface<Table extends EntityeBase> {
  @insert
  Future<int> insertItem(Table item);

  @update
  Future<int> updateItem(Table item);

  @delete
  Future<int> deleteItem(Table item);
}
