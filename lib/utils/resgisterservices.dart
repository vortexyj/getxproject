import 'package:get/get.dart';
import 'package:getxproject/controller/assistdialogcontroller.dart';
import 'package:getxproject/services/httpservices.dart';

Future<void> registersevices() async {
  Get.put(Httpservices());
}

Future<void> registerControllers() async {
  Get.put(
    AssistDialogController(),
  );
}
