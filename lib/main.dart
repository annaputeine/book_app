import 'package:books_app/my_app.dart';
import 'package:books_app/repository/book_repository.dart';
import 'package:books_app/repository/network_book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/book_api_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1'));
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  final bookApiClient = BookApiClient(dio);
  final networkBookRepository = NetworkBookRepository(bookApiClient);
  final bookRepositoryProvider = RepositoryProvider<BookRepository>(
    create: (context) => networkBookRepository,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [bookRepositoryProvider],
      child: const MyApp(),
    ),
  );
}
