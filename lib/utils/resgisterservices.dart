import 'package:get/get.dart';
import 'package:getxproject/controller/assetscontroller.dart';
import 'package:getxproject/controller/assistdialogcontroller.dart';
import 'package:getxproject/services/httpservices.dart';

Future<void> registersevices() async {
  Get.put(Httpservices());
}

Future<void> assetsController() async {
  Get.put(
    AssetsController(),
  );
}

String getCryptoImageURL(String name) {
  return "https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/master/128/${name.toLowerCase()}.png";
}
