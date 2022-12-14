import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';
import 'package:wtf_gym_list/domain/model/popular_location.dart';

part 'location_setting_event.dart';
part 'location_setting_state.dart';

class LocationSettingBloc
    extends Bloc<LocationSettingEvent, LocationSettingState> {
  LocationSettingBloc() : super(InitialLocationSetting()) {
    on<UpdateLocation>(_updateLocation);
  }

  FutureOr<void> _updateLocation(
    UpdateLocation event,
    Emitter<LocationSettingState> emit,
  ) {
    final updatedState = UserLocationSetting(
      city: event.city,
      location: event.location,
    );
    emit(updatedState);
  }
}
