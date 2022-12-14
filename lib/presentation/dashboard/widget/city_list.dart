import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_list/domain/model/city_model.dart';
import 'package:wtf_gym_list/presentation/dashboard/bloc/location_setting_bloc.dart';

class DisplayCityList extends StatelessWidget {
  const DisplayCityList({
    super.key,
    required this.cities,
  });

  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: cities.map((e) => CityCard(city: e)).toList(),
    );
  }
}

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.city,
  });

  final City city;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = context.read<LocationSettingBloc>();
        bloc.add(UpdateLocation(city: city));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CachedNetworkImage(
                imageUrl: city.image,
                width: 50,
                height: 50,
              ),
            ),
            Text(city.city),
          ],
        ),
      ),
    );
  }
}
