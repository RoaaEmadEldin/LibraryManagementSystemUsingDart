import 'Book.dart';

class BookDetailsPrinter{
  void printBooks(List<Book> books){
    // Using 'forEach' function to print the details of each book
    books.forEach(print);
  }
}