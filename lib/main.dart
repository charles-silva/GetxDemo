import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getdemo/app/core/controller/app_binding.dart';
import 'package:getdemo/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //var appController = Get.find<AppController>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        //brightness: ThemeData.dark().brightness,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: [
        ...AppPages.routes,
      ],
    );
  }
}
