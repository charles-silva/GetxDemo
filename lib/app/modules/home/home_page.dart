import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/app/modules/home/home_controller.dart';
import 'package:getdemo/app/modules/home/widgets/home_include_widget.dart';
import 'package:getdemo/app/modules/home/widgets/home_todo_list_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(
                    'CONFIGURAÇÕES',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text('rcharlesss@hotmail.com'),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Usar modo noturno?',
                      style: TextStyle(fontSize: 16),
                    ),
                    Obx(() {
                      return Switch(
                        value: controller.isDark.value,
                        onChanged: (V) {
                          controller.isDark.value = V;
                          controller.changeTheme();
                        },
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Salvar dados local?',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: false,
                      onChanged: (Value) {
                        controller.changeTheme();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return HomeIncludeWidget();
              });
        },
      ),
      body: HomeTodoListWidget(
        todos: controller.todos,
      ),
    );
  }
}
