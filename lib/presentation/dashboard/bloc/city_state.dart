part of 'city_bloc.dart';

abstract class CityState {}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  CityLoaded(this.cities);
  final List<City> cities;
}

class CityError extends CityState {
  CityError(this.message);
  final String message;
}
