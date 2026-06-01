import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String authors;
  final String coverImageUrl;
  final String? coverThumbnailUrl;
  final int pageCount;
  final int ratingCount;
  final int averageRating;
  final String releaseYear;
  final String? faveId;

  const Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.coverImageUrl,
    required this.coverThumbnailUrl,
    required this.pageCount,
    required this.ratingCount,
    required this.averageRating,
    required this.releaseYear,
    required this.faveId,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    description,
    authors,
    coverImageUrl,
    coverThumbnailUrl,
    pageCount,
    ratingCount,
    averageRating,
    releaseYear,
    faveId,
  ];
}
