import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';
import 'package:wtf_gym_list/domain/model/popular_location.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/location_setting_bloc.dart';

class PopularLocationsList extends StatelessWidget {
  const PopularLocationsList({
    super.key,
    required this.city,
    this.selectedLocation,
  });
  final City city;
  final PopularLocation? selectedLocation;

  @override
  Widget build(BuildContext context) {
    final popularLocations = city.popularLocations;
    final bloc = context.read<LocationSettingBloc>();

    return Wrap(
      children: [
        PopularLocationChip(
          'All',
          selected: selectedLocation == null,
          onTap: () {
            bloc.add(UpdateLocation(city: city, location: null));
          },
        ),
        ...popularLocations.map((e) {
          return PopularLocationChip(
            e.location,
            selected: selectedLocation == e,
            onTap: () {
              bloc.add(UpdateLocation(city: city, location: e));
            },
          );
        }).toList()
      ],
    );
  }
}

class PopularLocationChip extends StatelessWidget {
  const PopularLocationChip(
    this.text, {
    super.key,
    this.onTap,
    this.selected = false,
  });

  final String text;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(text),
          backgroundColor: selected ? Colors.blue : null,
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
