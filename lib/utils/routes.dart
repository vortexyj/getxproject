import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getxproject/pages/homepage.dart';

abstract class AppRouter {
  static const kHomeView = '/home';

  static final routes = [
    GetPage(name: kHomeView, page: () => const HomePage()),
  ];
}
