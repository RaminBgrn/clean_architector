import 'package:clean_achitector/feature/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:clean_achitector/feature/feature_weather/data/models/current_city_model.dart';
import 'package:clean_achitector/feature/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_achitector/core/resources/data_state.dart';
import 'package:clean_achitector/feature/feature_weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiProvider apiProvider;

  WeatherRepositoryImpl({required this.apiProvider});

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentCityData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCity);
      } else {
        return const DataFailed('Something Went Wrong. Please try again... ');
      }
    } catch (e) {
      return const DataFailed('Please Check Your Connection...');
    }
  }
}
