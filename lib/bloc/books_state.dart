part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitialState extends BooksState {}

class LoadingState extends BooksState {}

class LoadingErrorState extends BooksState {
  final String errMessage;
  const LoadingErrorState({required this.errMessage});

  @override
  List<Object> get props => [];
}

class NoResultsSate extends BooksState {}

class ResultFoundState extends BooksState {
  final List<dynamic> books;
  const ResultFoundState({required this.books});

  @override
  List<Object> get props => [books];
}
