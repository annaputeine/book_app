import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({super.key, required this.book});

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
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: .all(10),
                  child: Text(
                    book.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: 10,
                    end: 10,
                    top: 0,
                    bottom: 10,
                  ),
                  child: Text(
                    book.authors,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          /*Text(
            book.ratingCount,
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.star, size: 24, color: Colors.deepPurple),*/
        ],
      ),
    );
  }
}
