import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/popular_location.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/city_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/location_setting_bloc.dart';
import 'package:wtf_gym_list/presentation/dashboard/widget/city_list.dart';
import 'package:wtf_gym_list/presentation/dashboard/widget/popular_location.dart';

class ChangeLocationSheet extends StatelessWidget {
  const ChangeLocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Prefered City',
              style: Theme.of(context).textTheme.headline5,
            ),
            BlocBuilder<CityBloc, CityState>(
              builder: (context, state) {
                if (state is CityLoaded) {
                  return DisplayCityList(cities: state.cities);
                } else if (state is CityError) {
                  return Text(state.message);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Location',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 20),
            BlocBuilder<LocationSettingBloc, LocationSettingState>(
              builder: (context, state) {
                if (state is UserLocationSetting) {
                  PopularLocation? location = state.location;
                  return PopularLocationsList(
                    city: state.city,
                    selectedLocation: location,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            BlocBuilder<LocationSettingBloc, LocationSettingState>(
              builder: (context, state) {
                String? city;
                String? location;
                if (state is UserLocationSetting) {
                  city = state.city.city;
                  location = state.location?.location;
                }
                return ElevatedButton(
                  onPressed: () {
                    if (city != null) {
                      final event = LoadGym(city: city, location: location);
                      context.read<DashboardBloc>().add(event);
                      Navigator.pop(context);
                    }
                  },
                  child: const Center(child: Text('Apply')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
