import 'package:clean_achitector/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  var apiKey = Constants.apiKey;

  /* Current weather api call */
  Future<dynamic> callCurrentWeather(String cityName) async {
    var response = await _dio.get(
      "${Constants.baseUrl}/data/2.5/weather",
      queryParameters: {
        'q': cityName,
        'appid': apiKey,
        'units': 'metric',
      },
    );
    return response;
  }
}
