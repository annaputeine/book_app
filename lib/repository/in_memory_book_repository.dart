import 'package:books_app/repository/book_repository.dart';
import 'package:books_app/model/book.dart';

class InMemoryBookRepository implements BookRepository {
  final List<Book> _books = [
    Book(
      id: 'BOOK1',
      title: 'Marina',
      subtitle: 'A Gothic Mystery',
      description: 'A haunting mystery set in Barcelona.',
      authors: 'Carlos Ruiz Zafon',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 304,
      ratingCount: 49,
      averageRating: 4,
      releaseYear: '2013',
      faveId: null,
    ),

    Book(
      id: 'BOOK2',
      title: 'The Silent Patient',
      subtitle: 'Psychological Thriller',
      description: 'A woman shoots her husband and never speaks again.',
      authors: 'Alex Michaelides',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 336,
      ratingCount: 320,
      averageRating: 5,
      releaseYear: '2019',
      faveId: null,
    ),

    Book(
      id: 'BOOK3',
      title: 'Atomic Habits',
      subtitle: 'Self Improvement',
      description: 'Tiny changes make remarkable results.',
      authors: 'James Clear',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 320,
      ratingCount: 1200,
      averageRating: 5,
      releaseYear: '2018',
      faveId: null,
    ),

    Book(
      id: 'BOOK4',
      title: 'Dune',
      subtitle: 'Sci-Fi Epic',
      description: 'A legendary science fiction masterpiece.',
      authors: 'Frank Herbert',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 688,
      ratingCount: 876,
      averageRating: 5,
      releaseYear: '1965',
      faveId: null,
    ),

    Book(
      id: 'BOOK5',
      title: '1984',
      subtitle: 'Classic Dystopian Novel',
      description: 'A terrifying vision of a controlled society.',
      authors: 'George Orwell',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 328,
      ratingCount: 540,
      averageRating: 4,
      releaseYear: '1949',
      faveId: null,
    ),

    Book(
      id: 'BOOK6',
      title: 'The Hobbit',
      subtitle: 'Fantasy Adventure',
      description: 'Bilbo Baggins goes on an unexpected journey.',
      authors: 'J.R.R. Tolkien',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 310,
      ratingCount: 998,
      averageRating: 5,
      releaseYear: '1937',
      faveId: null,
    ),

    Book(
      id: 'BOOK7',
      title: 'The Alchemist',
      subtitle: 'Inspirational Fiction',
      description: 'A journey about destiny and dreams.',
      authors: 'Paulo Coelho',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 208,
      ratingCount: 745,
      averageRating: 4,
      releaseYear: '1988',
      faveId: null,
    ),

    Book(
      id: 'BOOK8',
      title: 'To Kill a Mockingbird',
      subtitle: 'Classic Literature',
      description: 'A story about justice and morality.',
      authors: 'Harper Lee',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 281,
      ratingCount: 890,
      averageRating: 5,
      releaseYear: '1960',
      faveId: null,
    ),

    Book(
      id: 'BOOK9',
      title: 'The Midnight Library',
      subtitle: 'Fantasy Drama',
      description: 'Between life and death lies the Midnight Library.',
      authors: 'Matt Haig',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 304,
      ratingCount: 410,
      averageRating: 4,
      releaseYear: '2020',
      faveId: null,
    ),

    Book(
      id: 'BOOK10',
      title: 'Rich Dad Poor Dad',
      subtitle: 'Personal Finance',
      description: 'What the rich teach their kids about money.',
      authors: 'Robert Kiyosaki',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 336,
      ratingCount: 653,
      averageRating: 4,
      releaseYear: '1997',
      faveId: null,
    ),

    Book(
      id: 'BOOK11',
      title: 'The Great Gatsby',
      subtitle: 'Classic American Novel',
      description: 'A story of wealth, love, and the American dream.',
      authors: 'F. Scott Fitzgerald',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 180,
      ratingCount: 777,
      averageRating: 4,
      releaseYear: '1925',
      faveId: null,
    ),
  ];

  @override
  Future<List<Book>> getBooks(String query) {
    if (query.trim().isEmpty) {
      return Future.value(_books);
    }

    final searchParamLower = query.toLowerCase();

    return Future.value(
      _books.where((book) {
        return book.title.toLowerCase().contains(searchParamLower) ||
            book.subtitle.toLowerCase().contains(searchParamLower) ||
            book.description.toLowerCase().contains(searchParamLower) ||
            book.authors.toLowerCase().contains(searchParamLower);
      }).toList(),
    );
  }
}
