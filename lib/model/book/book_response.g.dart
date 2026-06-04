// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
  (json['items'] as List<dynamic>)
      .map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  id: json['id'] as String,
  volumeInfo: VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
);

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  description: json['description'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  imageLinks: json['imageLinks'] == null
      ? null
      : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
  pageCount: (json['pageCount'] as num?)?.toInt(),
  ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  publishedDate: json['publishedDate'] as String?,
);

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) =>
    ImageLinks(json['smallThumbnail'] as String);
