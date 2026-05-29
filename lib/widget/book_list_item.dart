import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final int _averageRating;

  BookListItem({super.key, required this.book}) : _averageRating = book.averageRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              book.coverImageUrl,
              width: 80,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  book.authors,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    _averageRating > 0
                        ? _FilledStar()
                        : _OutlinedStar(),
                    _averageRating > 1
                        ? _FilledStar()
                        : _OutlinedStar(),
                    _averageRating > 2
                        ? _FilledStar()
                        : _OutlinedStar(),
                    _averageRating > 3
                        ? _FilledStar()
                        : _OutlinedStar(),
                    _averageRating > 4
                        ? _FilledStar()
                        : _OutlinedStar(),
                    Text(
                      "(${book.ratingCount})",
                      style: TextStyle(
                        color: Color(0xFF8c6c0b),
                        fontWeight: .w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilledStar extends StatelessWidget{
  const _FilledStar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.star, size: 16, color: Color(0xFF8c6c0b));
  }
}

class _OutlinedStar extends StatelessWidget{
  const _OutlinedStar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.star_border, size: 16, color: Color(0xFF8c6c0b));
  }
}