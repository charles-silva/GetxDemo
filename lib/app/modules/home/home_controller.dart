// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/app/models/todo_model.dart';
import 'package:getdemo/app/repositories/todos_repository.dart';

class HomeController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;
  final TodosRepository _repository;

  RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark = Get.isDarkMode.obs;
    fetchAll();
  }

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode
        ? ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
            useMaterial3: true)
        : ThemeData.dark().copyWith(useMaterial3: true));
  }

  HomeController({
    required TodosRepository repository,
  }) : _repository = repository;

  Future<void> fetchAll() async {
    final items = await _repository.fetchAll();
    return todos.assignAll(items);
  }

  Future<void> save(String description) async {
    var todo = Todo(description, false);

    final sucess = await _repository.create(todo);
    if (sucess) {
      fetchAll();
    }
  }
}
