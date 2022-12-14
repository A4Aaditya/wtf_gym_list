part of 'location_setting_bloc.dart';

abstract class LocationSettingEvent {}

class UpdateLocation extends LocationSettingEvent {
  UpdateLocation({
    required this.city,
    this.location,
  });

  final City city;
  final PopularLocation? location;
}
