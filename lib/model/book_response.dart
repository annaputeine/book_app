import 'package:equatable/equatable.dart';
import 'package:books_app/model/book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class BookResponse extends Equatable {
  final List<Item> items;

  const BookResponse(this.items);

  factory BookResponse.fromJson(Map<String, dynamic> json) => _$BookResponseFromJson(json);

  @override
  List<Object?> get props => [items];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Item extends Equatable {
  final String id;
  final VolumeInfo volumeInfo;

  const Item({required this.id, required this.volumeInfo});

  Book toBook() {
    return Book(
      id: id,
      title: volumeInfo.title,
      subtitle: volumeInfo.subtitle ?? '',
      description: volumeInfo.description ?? '',
      authors: volumeInfo.authors?.join(', ') ?? '',
      coverImageUrl: volumeInfo.imageLinks?.smallThumbnail ?? '',
      coverThumbnailUrl: null,
      pageCount: volumeInfo.pageCount ?? 0,
      ratingCount: volumeInfo.ratingsCount,
      averageRating: volumeInfo.averageRating,
      releaseYear: volumeInfo.publishedDate == null
          ? ''
          : volumeInfo.publishedDate!.length >= 4
          ? volumeInfo.publishedDate!.substring(0, 4)
          : volumeInfo.publishedDate!,
      faveId: null,
    );
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  List<Object?> get props => [id, volumeInfo];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class VolumeInfo extends Equatable {
  final String title;
  final String? subtitle;
  final String? description;
  final List<String>? authors;
  final ImageLinks? imageLinks;
  final int? pageCount;
  final int? ratingsCount;
  final double? averageRating;
  final String? publishedDate;

  const VolumeInfo({
    required this.title,
    this.subtitle,
    this.description,
    this.authors,
    this.imageLinks,
    this.pageCount,
    this.ratingsCount,
    this.averageRating,
    this.publishedDate,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);

  @override
  List<Object?> get props => [title, subtitle, description, authors, imageLinks, pageCount, publishedDate];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class ImageLinks extends Equatable {
  final String smallThumbnail;

  const ImageLinks(this.smallThumbnail);

  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);

  @override
  List<Object?> get props => [smallThumbnail];
}
