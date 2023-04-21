import 'package:getdemo/app/models/todo_model.dart';

abstract class TodosRepository {
  Future<List<Todo>> fetchAll();
  Future<bool> create(Todo todo);
  Future<bool> update(Todo todo);
  Future<bool> delete(Todo todo);
}
