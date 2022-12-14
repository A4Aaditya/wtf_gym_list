import 'package:dartz/dartz.dart';
import 'package:wtf_gym_list/domain/model/gym.dart';

abstract class GymRepository {
  Future<Either<String, List<Gym>>> gymByLocation({
    required String city,
    required String? location,
  });
}
