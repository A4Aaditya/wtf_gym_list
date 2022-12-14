import 'package:wtf_gym_list/domain/model/popular_location.dart';

class City {
  City({
    required this.id,
    required this.uid,
    required this.city,
    required this.dateAdded,
    required this.status,
    required this.popularLocations,
    required this.image,
  });

  final String id;
  final String uid;
  final String city;
  final String dateAdded;
  final String status;
  final List<PopularLocation> popularLocations;
  final String image;

  factory City.fromMap(Map<String, dynamic> map) {
    final locations = map['popular_locations'] as List<dynamic>;
    final popularLocation = locations
        .map((x) => PopularLocation.fromMap(x as Map<String, dynamic>))
        .toList();
    return City(
      id: map['id'],
      uid: map['uid'],
      city: map['city'],
      dateAdded: map['date_added'],
      status: map['status'],
      popularLocations: popularLocation,
      image: map['image'],
    );
  }
}
