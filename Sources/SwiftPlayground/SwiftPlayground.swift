// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// This Struct contains the books that will be issued out.
///     Id: the unique id number for each book.
///     bookTitle: the title of the book.
///     available: a true or false statement showing if the book is available.
///     author: the author of the book.
struct Book: Identifiable, Hashable, Equatable, CustomStringConvertible {
    let id: UUID
    let bookTitle: String
    let available: Bool
    let author: String
    var description: String 
        {"| This book is called \(bookTitle), the author is \(author), it's availability is \(available) |"}
}

/// This struct contains the students who will be issuing out the books.
///     id: the id of the student as a UUID.
///     name: the name of the student.
///     age: the age of the student.
struct Student: CustomStringConvertible, Identifiable, Hashable {
    let id: UUID
    var name: String
    var age: Int
    var description: String {"| The sutdent's name is \(name) they are \(age) years old and their id is \(id) |"}
}


/// This struct contains each request to issue a book from a student.
///     id: The id of the request for a student to issue a book.
///     studentID: the id of the student issuing the book.
///     bookID: the id of the book they are issuing.
struct Request: Hashable, CustomStringConvertible, Identifiable, Equatable {
    let id: UUID
    let studentID: UUID
    let bookID: UUID
    var description: String {"This is a request for a student with id \(studentID) to issue a book with id \(bookID)"}
    }




@main
struct SwiftPlayground {
    static func main() {

        // Creates a variable that is used for the user's entry.
        var userEntry: String = ""
        // Creates a list of books using the "Book" struct.
        var books = [
            Book(id: UUID(), bookTitle: "Wool", available: true, author: "Hugh Howey"),
            Book(id: UUID(), bookTitle: "Shift", available: false, author: "Hugh Howey"),
            Book(id: UUID(), bookTitle: "BookA", available: true, author: "Dylan"),
            Book(id: UUID(), bookTitle: "Biography", available: true, author: "Greg"),
            Book(id: UUID(), bookTitle: "Memoir", available: false, author: "Bernard"),
            Book(id: UUID(), bookTitle: "BookB", available: true, author: "Oli"),
            Book(id: UUID(), bookTitle: "BookC", available: true, author: "Theo")
        ]

        // Creates a list of students.
        var students = (
            Student(id: UUID(), name: "Dylan", age: 17)
        )
        // Prints a message to start the program.
        print("Hello, welcome to the Onslow Book Borrowing System, how may we help you?, A: Add a book to the library? | B: Register a borrower/User? | C: Print a list of books? | D: Issue a book to a student?")
        
        // Aquires user's choice and returns it if it is null.
        guard let userEntry = readLine(), !userEntry.isEmpty else {
            print("please enter a valid input")
            return
        }

        // Code for if the user wants to add a book to the library.
        if userEntry.lowercased() == "a" {

            // Creates variables which are used for user input for title and author.
            let userBookTitle: String = ""
            let userBookAuthor: String = ""

            // Asks user what the title is, value is returned if the input is null, their choice is then printed.
            print("What is the name of the book?")
            guard let userBookTitle = readLine(), !userBookTitle.isEmpty else {
                print("Book Title is required")
                return
            }
            print("Your book title is \(userBookTitle)")

            // Asks the user who the author of the book is, 
            // value is returned if input is null, their choice is then printed.
            print("Who is the author?")
            guard let userBookAuthor = readLine(), !userBookAuthor.isEmpty else {
                print("Book Author is required")
                return
            }
            print("Your author is \(userBookAuthor)")

            // Creates a new instance of the "Book" Struct using the variables aquired from user input,
            // This instance is assigned to a variable which is added to the list of books.
            var userBookEntry = Book(id: UUID(), bookTitle: userBookTitle, available: true, author: userBookAuthor)
            books.append(userBookEntry)
            print("The new list of available books is \(books)")
        }






        if userEntry.lowercased() == "b" {
            var userAgeInput: String = ""
            var userName: String = ""

            print("What is the name of the student you're adding?")
            guard let userName = readLine(), !userName.isEmpty else {
                print("Name is required")
                return
            }

            do {
                print("How old is the student?")
                guard let userAgeInput = readLine(), !userAgeInput.isEmpty else {
                    print("Age is required")
                    return
                }

                var userAge = Int(userAgeInput)
            } catch {
                print(error)

                var studentEntry = Student(id: UUID(), name: userName, age: userAge)
            }

            

            print("The new list of students is \(students)")

        }

        if userEntry.lowercased() == "c" {
            print("List of available books is \(books)")
        }
    }    
}


