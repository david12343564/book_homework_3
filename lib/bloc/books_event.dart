part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class SearchingEvent extends BooksEvent {
  final String bookTitle;
  SearchingEvent({required this.bookTitle});

  @override
  List<Object> get props => [bookTitle];
}
