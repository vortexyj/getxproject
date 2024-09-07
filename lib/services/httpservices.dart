import 'package:dio/dio.dart';
import 'package:getxproject/constants.dart';

class Httpservices {
  final Dio dio = Dio();
  Httpservices() {
    dioConfigure();
  }
  void dioConfigure() {
    dio.options = BaseOptions(
      baseUrl: 'https://api.cryptorank.io/v1/',
      queryParameters: {"api_key": kapiKey},
    );
  }

  Future<dynamic> get(String url) async {
    try {
      Response response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        // Error with response
        print('Error: ${e.response?.statusCode} ${e.response?.data}');
        return e.response?.data; // Return error response
      } else {
        // Error without response, like network or timeout
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }
}
