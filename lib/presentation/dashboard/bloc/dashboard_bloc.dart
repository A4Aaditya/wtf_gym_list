import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/gym.dart';
import 'package:wtf_gym_list/domain/repository/gym_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.repository,
  }) : super(DashboardInitial()) {
    on<LoadGym>(_loadGym);
  }

  final GymRepository repository;

  FutureOr<void> _loadGym(
    LoadGym event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    final city = event.city;
    final location = event.location;
    final result = await repository.gymByLocation(
      city: city,
      location: location,
    );
    result.fold(
      (l) => emit(DashboardError(l)),
      (r) => emit(DashboardLoaded(r)),
    );
  }
}
