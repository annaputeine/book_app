import 'package:flutter/material.dart';
import '../model/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebddc0),
      appBar: AppBar(
        title: Text('Book Details'),
        titleTextStyle: TextStyle(
          color: Colors.grey[900],
          fontWeight: .w600,
          fontSize: 20,
        ),
        centerTitle: false,
        backgroundColor: Color(0xFFebddc0),
      ),
      body: Padding(
        padding: .all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                book.coverImageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
