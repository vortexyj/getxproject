import 'package:get/get.dart';
import 'package:getxproject/models/api_response.dart';
import 'package:getxproject/services/httpservices.dart';

class AssetsDialogController extends GetxController {
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;
  RxString selectedAsset = "BitCoins".obs;
  RxDouble assetsValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getAssets();
  }

  Future<void> getAssets() async {
    loading.value = true;
    try {
      Httpservices httpservices = Get.find<Httpservices>();
      var responseData = await httpservices.get("currencies");
      CurrenciesListAPIResponse currenciesListAPIResponse =
          CurrenciesListAPIResponse.fromJson(responseData);
      currenciesListAPIResponse.data?.forEach((coin) {
        assets.add(coin.name!);
      });
      selectedAsset.value = assets.first;
      print(responseData);
      loading.value = false;
    } on Exception catch (e) {
      print(e);
      loading.value = false;
    }
  }
}
