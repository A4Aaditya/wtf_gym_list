import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';
import 'package:wtf_gym_list/domain/repository/city_repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc({
    required this.repository,
  }) : super(CityInitial()) {
    on<FetchCity>(_fetchCity);
  }

  final CityRepository repository;

  FutureOr<void> _fetchCity(
    FetchCity event,
    Emitter<CityState> emit,
  ) async {
    emit(CityLoading());
    final result = await repository.getCities();
    result.fold(
      (left) => emit(CityError(left)),
      (right) => emit(CityLoaded(right)),
    );
  }
}
