import 'package:clean_achitector/core/resources/data_state.dart';
import 'package:clean_achitector/feature/feature_weather/domain/entities/current_city_entity.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentCityData(String cityName);
}
