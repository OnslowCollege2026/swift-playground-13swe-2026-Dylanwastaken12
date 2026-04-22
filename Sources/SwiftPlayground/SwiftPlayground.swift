// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// This Struct contains the books that will be issued out
///     id: the unique id number for each book
///     bookTitle: the title of the book
///     available: a true or false statement showing if the book is available
///     author: the author of the book
struct Book: Identifiable, Hashable, Equatable {
    let id: UUID
    let bookTitle: String
    let available: Bool
    let author: String
}

/// This struct contains the students who will be issuing out the books
///     id: the id of the student as a UUID
///     name: the name of the student
///     age: the age of the student
struct Student {
    let id: UUID
    var name: String
    var age: Int
}


/// This struct contains each request to issue a book from a student
///     studentID: the id of the student issuing the book
///     bookID: the id of the book they are issuing
struct Request {
    let studentID: UUID
    let bookID: UUID
}



@main
struct SwiftPlayground {
    static func main() {
        
        // creates a variable that is used for the user's entry
        var userEntry: String = ""
        var userChoice: String = ""
        // creates a list of books using the "Book" struct
        var books = (
            Book(id: UUID(), bookTitle: "Wool", available: true, author: "Hugh Howey"),
            Book(id: UUID(), bookTitle: "Shift", available: false, author: "Hugh Howey"),
            Book(id: UUID(), bookTitle: "BookA", available: true, author: "Dylan"),
            Book(id: UUID(), bookTitle: "Biography", available: true, author: "Greg"),
            Book(id: UUID(), bookTitle: "Memoir", available: false, author: "Bernard"),
            Book(id: UUID(), bookTitle: "BookB", available: true, author: "Oli"),
            Book(id: UUID(), bookTitle: "BookC", available: true, author: "Theo")
        )
        // prints a message to start the programm
        print("Hello, welcome to the Onslow Book Borrowing System, how may we help you?, A: Add a book to the library? | B: Register a borrower/User? | C: Print a list of books?")
    }
}

