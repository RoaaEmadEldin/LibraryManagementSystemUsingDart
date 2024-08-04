import 'Book.dart';

// A typedef that represents a function taking a book and returning a bool
typedef BookFilter = bool Function(Book book);

class LibraryManager{
  List<Book> availableBooks = [];

  LibraryManager(this.availableBooks);

  void addBookToLibrary(Book book){
    availableBooks.add(book);
  }

  void removeBookFromLibrary(Book book){
    availableBooks.remove(book);
  }

  int getBooksNumber(){
    return availableBooks.length;
  }

  // A method that filters a list of Books according to a BookFilter
  List<Book> filterBooks(List<Book> books, BookFilter filter){
    // Using 'where' to filter books by a certain criteria 'BookFilter'
    return books.where(filter).toList();
  }

  // A method that uses 'reduce' function to count the number of checked-out books
  int countCheckedOutBooks(){
    return availableBooks.map((book) => book.isCheckedOut ? 1 : 0).reduce((total, currentBookValue) => total + currentBookValue);
  }

  // A method that uses 'fold' function to count the number of books published after a given 'year'
  int totalBooksPublishedAfter(int year){
    return availableBooks.fold(0, (total, book) => (book.yearPublished) > year ? total + 1 : total);
  }

  List<String> getListOfBooksTitles([List<Book>? books]){
    List<Book> booksList = books ?? availableBooks;
    // Using 'map' function to create list of book titles
    return booksList.map((book) => book.title).toList();
  }
}