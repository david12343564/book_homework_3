import 'package:http/http.dart' as http;
import 'dart:convert';

class BookRepository {
  dynamic bookList;

  Future<dynamic> getBookList(String bookTitle) async {
    Uri url =
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$bookTitle");
    try {
      dynamic response = await http.get(url);
      bookList = jsonDecode(response.body);
      return bookList;
    } catch (e) {
      throw "Error";
    }
  }
}
