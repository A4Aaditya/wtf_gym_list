part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class LoadGym extends DashboardEvent {
  final String city;
  final String? location;
  LoadGym({
    required this.city,
    required this.location,
  });
}
