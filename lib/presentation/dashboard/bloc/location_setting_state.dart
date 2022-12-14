part of 'location_setting_bloc.dart';

abstract class LocationSettingState {}

class InitialLocationSetting extends LocationSettingState {}

class UserLocationSetting extends LocationSettingState {
  UserLocationSetting({
    required this.city,
    this.location,
  });

  final City city;
  final PopularLocation? location;

  String get friendlyText => '${city.city}  ${location?.location ?? ''}';
}
