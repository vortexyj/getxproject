import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controller/assetscontroller.dart';
import 'package:getxproject/controller/assistdialogcontroller.dart';

class ButtomSheet extends StatelessWidget {
  ButtomSheet({super.key});
  final controller = Get.put(
    AssetsDialogController(),
  );
  // final AssistDialogController controller = Get.find(); // Use Get.find instead

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      width: double.infinity,
      child: Center(
        child: Obx(() => uiBuilder(context)), // Wrap in Obx
      ),
    );
  }

  Widget uiBuilder(BuildContext context) {
    if (controller.loading.isTrue) {
      return const SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton(
              value: controller.selectedAsset.value,
              items: controller.assets.map(
                (asset) {
                  return DropdownMenuItem(
                    value: asset,
                    child: Text(asset),
                  );
                },
              ).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.selectedAsset.value = value;
                } else {}
              },
            ),
            TextField(
              onChanged: (Value) {
                controller.assetsValue.value = double.parse(Value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () {
                AssetsController assetsController = Get.find();
                assetsController.addTrackedAssets(
                    controller.selectedAsset.value,
                    controller.assetsValue.value);
                Get.back();
              },
              color: Colors.black,
              child: const Text(
                'Add Assets',
                style: TextStyle(color: Colors.white),
              ),
            )
          ], // Display assets dynamically
        ),
      );
    }
  }
}
