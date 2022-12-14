part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  DashboardLoaded(this.gyms);
  final List<Gym> gyms;
}

class DashboardError extends DashboardState {
  DashboardError(this.message);
  final String message;
}
