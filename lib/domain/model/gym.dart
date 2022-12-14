import 'package:wtf_gym_list/domain/model/benefit.dart';
import 'package:wtf_gym_list/domain/model/gallery.dart';

class Gym {
  Gym({
    required this.userId,
    required this.gymName,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.pin,
    required this.country,
    required this.name,
    required this.freeTrial,
    required this.distanceText,
    required this.durationText,
    required this.duration,
    required this.rating,
    required this.text1,
    required this.text2,
    required this.planName,
    required this.planDuration,
    required this.planPrice,
    required this.planDescription,
    required this.coverImage,
    required this.gallery,
    required this.type,
    required this.description,
    required this.status,
    required this.slug,
    required this.categoryId,
    required this.offer,
    required this.benefits,
    required this.addons,
    required this.totalRating,
    required this.isPartial,
    required this.isCash,
    required this.categoryName,
    required this.wtfShare,
    required this.isDiscount,
  });

  final String userId;
  final String gymName;
  final String? address1;
  final String? address2;
  final String city;
  final String state;
  final String latitude;
  final String longitude;
  final String? pin;
  final String? country;
  final String name;
  final num? freeTrial;
  final String? distanceText;
  final String? durationText;
  final String? duration;
  final num? rating;
  final String coverImage;
  final List<Gallery> gallery;
  final String? type;
  final String? description;
  final String? status;
  final String? slug;
  final String? categoryId;
  final List<dynamic> offer;
  final List<Benefit> benefits;
  final List<dynamic> addons;
  final num? totalRating;
  final String? isPartial;
  final num? isCash;
  final String? categoryName;
  final num? wtfShare;
  final num? isDiscount;
  final dynamic text1;
  final dynamic text2;
  final dynamic planName;
  final dynamic planDuration;
  final dynamic planPrice;
  final dynamic planDescription;

  factory Gym.fromMap(Map<String, dynamic> map) {
    return Gym(
      userId: map['user_id'],
      gymName: map['gym_name'],
      address1: map['address1'],
      address2: map['address2'],
      city: map['city'],
      state: map['state'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      pin: map['pin'],
      country: map['country'],
      name: map['name'],
      freeTrial: map['free_trial'],
      distanceText: map['distance_text'],
      durationText: map['duration_text'],
      duration: map['duration'],
      rating: map['rating'],
      text1: map['text1'],
      text2: map['text2'],
      planName: map['plan_name'],
      planDuration: map['plan_duration'],
      planPrice: map['plan_price'],
      planDescription: map['plan_description'],
      coverImage: map['cover_image'],
      gallery: (map['gallery'] as List)
          .map((x) => Gallery.fromMap(x as Map<String, dynamic>))
          .toList(),
      type: map['type'],
      description: map['description'],
      status: map['status'],
      slug: map['slug'],
      categoryId: map['category_id'],
      offer: map['offer'] as List<dynamic>,
      benefits: (map['benefits'] as List<dynamic>)
          .map((x) => Benefit.fromMap(x as Map<String, dynamic>))
          .toList(),
      addons: map['addons'] as List<dynamic>,
      totalRating: map['total_rating'],
      isPartial: map['is_partial'],
      isCash: map['is_cash'],
      categoryName: map['category_name'],
      wtfShare: map['wtf_share'],
      isDiscount: map['is_discount'],
    );
  }
}
