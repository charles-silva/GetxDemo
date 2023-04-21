import 'package:get/get.dart';
import 'package:getdemo/app/modules/home/home_binding.dart';
import 'package:getdemo/app/modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = <GetPage>[
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
