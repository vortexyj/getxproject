import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controller/assetscontroller.dart';
import 'package:getxproject/models/tracked_asset.dart';
import 'package:getxproject/pages/buttomsheet.dart';
import 'package:getxproject/pages/detailedpage.dart';
import 'package:getxproject/utils/resgisterservices.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 13, left: 13),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://avatars.githubusercontent.com/u/37553901?v=4',
                height: 60,
                width: 60,
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ButtomSheet();
                        });
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          buildUI(context),
        ],
      ),
    ));
  }

  Widget buildUI(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            protfolioValue(context),
            _trackedAssetsList(
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget protfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text: '\$',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              TextSpan(
                  text:
                      '${assetsController.getProtofolioValue().toStringAsFixed(2)}\n',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w400)),
              const TextSpan(
                  text: 'Protfolio Value',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trackedAssetsList(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: const Text(
              "Portfolio",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.65,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              itemCount: assetsController.trackedAsset.length,
              itemBuilder: (context, index) {
                TrackedAsset trackedAsset =
                    assetsController.trackedAsset[index];
                return ListTile(
                  leading: Image.network(
                    getCryptoImageURL(trackedAsset.name!),
                  ),
                  title: Text(
                    trackedAsset.name!,
                  ),
                  subtitle: Text(
                      "USD: ${assetsController.getCoinData(trackedAsset.name!).toString()}"),
                  trailing: Text(
                    trackedAsset.amount.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      () {
                        return DetailsPage(
                          coin:
                              assetsController.getCoinData(trackedAsset.name!)!,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
