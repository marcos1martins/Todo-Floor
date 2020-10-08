import 'package:floor/floor.dart';

class EntityeBase {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String createdAt;
  final String updateAt;

  EntityeBase(this.id, this.createdAt, this.updateAt);
}
