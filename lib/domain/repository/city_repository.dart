import 'package:dartz/dartz.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';

/// Contain methods related to citiy module
/// which can be consumed by presentation layer
abstract class CityRepository {
  /// Get all the available Cities from the server
  Future<Either<String, List<City>>> getCities();
}
