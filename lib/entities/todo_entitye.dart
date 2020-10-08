import 'package:floor/floor.dart';
import 'package:todo_floor/entities/entitye_base.dart';

@Entity(tableName: "Todos")
class TodoEntity extends EntityeBase {
  final String title;
  final String anotation;

  TodoEntity(
      {int id, String createdAt, String updateAt, this.title, this.anotation})
      : super(id, createdAt, updateAt);
}
