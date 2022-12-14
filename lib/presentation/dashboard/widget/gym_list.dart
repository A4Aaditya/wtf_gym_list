import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wtf_gym_list/domain/model/gym.dart';

class DisplayGymList extends StatelessWidget {
  const DisplayGymList({
    super.key,
    required this.gyms,
  });

  final List<Gym> gyms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gyms.length,
      itemBuilder: (context, index) {
        return GymCard(gym: gyms[index]);
      },
    );
  }
}

class GymCard extends StatelessWidget {
  const GymCard({
    super.key,
    required this.gym,
  });
  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: gym.coverImage,
              width: double.maxFinite,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      gym.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      gym.distanceText ?? '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Text(
                  '${gym.address1} ${gym.address2}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
