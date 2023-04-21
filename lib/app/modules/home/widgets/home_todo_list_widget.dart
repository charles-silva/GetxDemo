import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/app/models/todo_model.dart';

class HomeTodoListWidget extends StatelessWidget {
  final List<Todo> todos;
  const HomeTodoListWidget({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            var item = todos[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.description,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.redAccent[200],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
