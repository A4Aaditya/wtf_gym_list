class Gallery {
  Gallery({
    required this.id,
    required this.uid,
    required this.gymId,
    required this.categoryId,
    required this.images,
    required this.status,
    required this.dateAdded,
    required this.lastUpdated,
    required this.type,
  });

  final int id;
  final String uid;
  final String gymId;
  final String categoryId;
  final String images;
  final String status;
  final String dateAdded;
  final String lastUpdated;
  final String type;

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      id: map['id'],
      uid: map['uid'],
      gymId: map['gym_id'],
      categoryId: map['category_id'],
      images: map['images'],
      status: map['status'],
      dateAdded: map['date_added'],
      lastUpdated: map['last_updated'],
      type: map['type'],
    );
  }
}
