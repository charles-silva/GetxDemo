import 'package:get/get.dart';
import 'package:getdemo/app/modules/home/home_controller.dart';
import 'package:getdemo/app/repositories/local_todos_repository_impl.dart';
import 'package:getdemo/app/repositories/todos_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosRepository>(
      () => LocalTodosRepositoryImpl(),
    );
    Get.lazyPut(
      () => HomeController(
        repository: Get.find(),
      ),
    );
  }
}
