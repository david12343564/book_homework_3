import 'package:bloc/bloc.dart';
import 'package:book_homework_3/repository/Book_Repository.dart';
import 'package:equatable/equatable.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksState get initialState => BooksInitialState();

  final BookRepository bookRepository = BookRepository();
  BooksBloc() : super(BooksInitialState()) {
    on<SearchingEvent>(_searchBook);
  }

  Future<dynamic> _searchBook(SearchingEvent event, Emitter emit) async {
    emit(LoadingState());
    dynamic bookList;
    try {
      bookList = await bookRepository.getBookList(event.bookTitle);

      if (bookList["items"] == 0) {
        emit(NoResultsSate());
      }

      emit(ResultFoundState(books: bookList["items"]));
    } catch (e) {
      emit(LoadingErrorState(
          errMessage: "Error al hacer la búsqueda de libros"));
    }
  }
}
