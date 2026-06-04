import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/book.dart';
import '../../domain/repository/book_repository.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late final BookRepository _bookRepository;
  bool _isFavourite = false;

  @override
  void initState() {
    super.initState();
    _bookRepository = context.read();
    _setIsFavourite();
  }

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
        padding: .symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    widget.book.coverImageUrl,
                    width: double.infinity,
                    height: 196,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.book.title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  widget.book.subtitle,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.book.authors,
                  style: TextStyle(
                    color: Color(0xFF8c6c0b),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    _LinedTextBox(text: "Released", number: widget.book.releaseYear),
                    SizedBox(
                      width: 12,
                    ),
                    _LinedTextBox(text: "Pages", number: widget.book.pageCount.toString()),
                    SizedBox(
                      width: 12,
                    ),
                    _LinedTextBox(text: "Rating", number: widget.book.averageRating.toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  widget.book.description,
                  style: TextStyle(
                    color: Colors.grey[900],
                    //fontWeight: .w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.viewPaddingOf(context).bottom,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_isFavourite) {
            await _bookRepository.removeFavourite(widget.book.id);
          } else {
            await _bookRepository.addFavourite(widget.book.id);
          }

          setState(() {
            _isFavourite = !_isFavourite;
          });
        },
        backgroundColor: Color(0xFF8c6c0b),
        shape: const CircleBorder(),
        child: Icon(
          _isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Future<void> _setIsFavourite() async {
    final value = await _bookRepository.checkFavourite(
      widget.book.id,
    );

    setState(() {
      _isFavourite = value;
    });
  }
}

class _LinedTextBox extends StatelessWidget {
  final String number;
  final String text;

  const _LinedTextBox({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 112,
      ),

      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF8c6c0b),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: .symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(text),
            number == 'null'
                ? Text(
                    "none",
                    style: TextStyle(
                      color: Color(0xFF8c6c0b),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                : Text(
                    number,
                    style: TextStyle(
                      color: Color(0xFF8c6c0b),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
