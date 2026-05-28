class Book {
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

  Book({
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
}
