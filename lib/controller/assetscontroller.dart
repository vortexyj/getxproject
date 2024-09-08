
import 'package:get/get.dart';
import 'package:getxproject/models/api_response.dart';
import 'package:getxproject/models/coin_data.dart';
import 'package:getxproject/models/tracked_asset.dart';
import 'package:getxproject/services/httpservices.dart';

class AssetsController extends GetxController {
  RxList<TrackedAsset> trackedAsset = <TrackedAsset>[].obs;
  RxList<CoinData> coindata = <CoinData>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    isloading.value = true;
    Httpservices httpservices = Get.find();
    var responseData = await httpservices.get('currencies');
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);
    coindata.value = currenciesListAPIResponse.data ?? [];
    isloading.value = false;
  }

  void addTrackedAssets(String name, double amount) {
    trackedAsset.add(TrackedAsset(name: name, amount: amount));
  }

  double getProtofolioValue() {
    if (coindata.isEmpty) {
      return 0;
    } else if (trackedAsset.isEmpty) {
      return 0;
    } else {
      double value = 0;
      for (TrackedAsset asset in trackedAsset) {
        value += _getAssetsPrice(asset.name!) * asset.amount!;
      }
      return value;
    }
  }

  double _getAssetsPrice(String name) {
    CoinData? data = getCoinData(name);
    return data?.values?.uSD?.price?.toDouble() ?? 0;
  }

  CoinData? getCoinData(String name) {
    return coindata.firstWhereOrNull((e) => e.name == name);
  }
}
