import 'package:books_app/my_app.dart';
import 'package:books_app/repository/book_repository.dart';
import 'package:books_app/repository/in_memory_book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final booksRepository = InMemoryBookRepository();

  final bookRepositoryProvider = RepositoryProvider<BookRepository>(
    create: (context) => booksRepository,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [bookRepositoryProvider],
      child: const MyApp(),
    ),
  );
}
