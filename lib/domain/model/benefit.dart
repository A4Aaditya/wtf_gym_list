class Benefit {
  Benefit({
    required this.id,
    required this.uid,
    required this.gymId,
    required this.name,
    required this.breif,
    required this.image,
    required this.status,
  });

  final int id;
  final String uid;
  final String gymId;
  final String name;
  final String breif;
  final String image;
  final String status;

  factory Benefit.fromMap(Map<String, dynamic> map) {
    return Benefit(
      id: map['id'],
      uid: map['uid'],
      gymId: map['gym_id'],
      name: map['name'],
      breif: map['breif'],
      image: map['image'],
      status: map['status'],
    );
  }
}
