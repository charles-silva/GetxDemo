import 'package:getdemo/app/models/todo_model.dart';

import 'todos_repository.dart';

class LocalTodosRepositoryImpl implements TodosRepository {
  final _todos = <Todo>[
    Todo('Limpar casa', true),
    Todo('Apagar a Luz', false),
  ];
  @override
  Future<List<Todo>> fetchAll() {
    return Future.value(_todos);
  }

  @override
  Future<bool> create(Todo todo) {
    _todos.add(todo);
    return Future.value(true);
  }

  @override
  Future<bool> delete(Todo todo) {
    _todos.remove(todo);
    return Future.value(true);
  }

  @override
  Future<bool> update(Todo todo) {
    return Future.value(true);
  }
}
