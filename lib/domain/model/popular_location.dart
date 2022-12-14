class PopularLocation {
  PopularLocation({
    required this.location,
    required this.address2,
    required this.pin,
    required this.country,
  });

  final String location;
  final String address2;
  final String pin;
  final String country;

  factory PopularLocation.fromMap(Map<String, dynamic> map) {
    return PopularLocation(
      location: map['location'],
      address2: map['address2'],
      pin: map['pin'],
      country: map['country'],
    );
  }
}
