import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/utils/resgisterservices.dart';
import 'package:getxproject/utils/routes.dart';

void main() async {
  await registersevices();
  await assetsController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.routes,
      initialRoute: AppRouter.kHomeView,
    );
  }
}
