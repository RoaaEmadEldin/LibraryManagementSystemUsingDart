class Book{
  String title;
  String author;
  int yearPublished;
  bool isCheckedOut;

  // Default Constructor initializes attributes
  Book({required this.title, required this.author, required this.yearPublished, this.isCheckedOut = false});

  // Named Constructor
  Book.unknownAuthor({this.title = "", this.author = "Unknown", this.yearPublished = 0, this.isCheckedOut = false});

  // Factory Constructor
  factory Book.fromMap(Map<String, dynamic> map){
    return Book(title: map["title"] ?? "",
        author: map["author"] ?? "Unknown",
        yearPublished: map["yearPublished"] ?? 0,
        isCheckedOut: map["isCheckedOut"] ?? false
    );
  }

  @override
  String toString() {
    return "Book Title: $title, Author: $author, Year Published: $yearPublished, ${getBookStatus()}";
  }

  String getBookStatus() {
    switch (this.isCheckedOut) {
      case true:
          return "Checked-Out";
      case false:
          return "Available";
    }
  }

  void changeBookStatus() => (this.isCheckedOut) ? this.isCheckedOut = false : this.isCheckedOut = true;
}