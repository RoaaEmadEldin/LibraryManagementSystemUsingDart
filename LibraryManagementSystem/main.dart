import 'Book.dart';
import 'BookDetailsPrinter.dart';
import 'LibraryManager.dart';


void main(){
  BookDetailsPrinter bookPrinter = BookDetailsPrinter();
  LibraryManager libraryManager = LibraryManager([
    Book(title: 'Brave New World', author: 'Aldous Huxley', yearPublished: 1932),
    Book(title: 'The Doors of Perception', author: 'Aldous Huxley', yearPublished: 1954, isCheckedOut: true),
    Book(title: 'Fahrenheit 451', author: 'Ray Bradbury', yearPublished: 1953, isCheckedOut: true),
    Book(title: 'Nine Stories', author: 'J.D. Salinger', yearPublished: 1953),
    Book(title: 'Go Set a Watchman', author: 'Harper Lee', yearPublished: 2015, isCheckedOut: false)
  ]);

  // Adding a book using Named Constructor
  libraryManager.addBookToLibrary(Book.unknownAuthor(title: "Happy World", yearPublished: 2020));

  // Adding a book using Factory Constructor
  libraryManager.addBookToLibrary(Book.fromMap({
    "title" : "Oliver Twist",
    "author" : "Charles Dickens",
    "yearPublished": 1838
  }));

  print("\nAvailable Books");
  print("================");
  libraryManager.availableBooks.forEach(print);

  print("\nFiltered Books");
  print("===============");
  bookPrinter.printBooks(
      libraryManager.filterBooks(libraryManager.availableBooks, (book) => book.author == "Aldous Huxley"));

  print("\nCurrent Available Books Titles");
  print("===============================");
  List<String> booksTitles = libraryManager.getListOfBooksTitles(
          libraryManager.filterBooks(libraryManager.availableBooks, (book) => !book.isCheckedOut));
  booksTitles.forEach(print);

  print("\nAll-Time Books Titles");
  print("========================");
  booksTitles = libraryManager.getListOfBooksTitles();
  booksTitles.forEach(print);

  print("\n ** Checked-Out Books Number: ${libraryManager.countCheckedOutBooks()}");

  int year = 1950;
  print(" ** Number of Books Published After $year: ${libraryManager.totalBooksPublishedAfter(year)}");

}