import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wtf_gym_list/data/utils/api_helper.dart';
import 'package:wtf_gym_list/data/utils/token_interceptor.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';
import 'package:wtf_gym_list/domain/repository/city_repository.dart';

class ICityRepository implements CityRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiHelper.baseUrl))
    ..interceptors.add(TokenInterceptor());

  @override
  Future<Either<String, List<City>>> getCities() async {
    try {
      final resposne = await _dio.get('/gym/cities');
      final statusCode = resposne.statusCode;
      if (statusCode == 200) {
        final body = resposne.data;
        final data = body['data'] as List<dynamic>;
        final cities =
            data.map((e) => City.fromMap(e as Map<String, dynamic>)).toList();
        return Right(cities);
      }
      return Left("Invalid Status Code $statusCode");
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      return Left("Invalid Status Code $statusCode");
    } catch (e) {
      return const Left("Unable to handle request");
    }
  }
}
