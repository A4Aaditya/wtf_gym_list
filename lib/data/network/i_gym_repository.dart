import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wtf_gym_list/data/utils/api_helper.dart';
import 'package:wtf_gym_list/data/utils/token_interceptor.dart';
import 'package:wtf_gym_list/domain/model/gym.dart';
import 'package:wtf_gym_list/domain/repository/gym_repository.dart';

class IGymRepository implements GymRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiHelper.baseUrl))
    ..interceptors.add(TokenInterceptor());

  @override
  Future<Either<String, List<Gym>>> gymByLocation({
    required String city,
    required String? location,
  }) async {
    try {
      final queryParameters = {
        'lat': '28.596669322602807',
        'long': '77.32866249084584',
        'type': 'gym',
        'city': city,
        if (location != null) 'location': location,
      };
      final response = await _dio.get(
        "/gym/nearestgym",
        queryParameters: queryParameters,
      );
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final body = response.data;
        final data = body['data'] as List<dynamic>;
        final gyms =
            data.map((e) => Gym.fromMap(e as Map<String, dynamic>)).toList();
        return Right(gyms);
      }
      return Left("Invalid Status Code $statusCode");
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      return Left("API Error with Status Code $statusCode");
    } catch (e) {
      return const Left("Unable to handle request");
    }
  }
}
