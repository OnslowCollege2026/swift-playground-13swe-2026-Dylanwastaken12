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
    var available: Bool
    let author: String
    var description: String 
        {"| Title: \(bookTitle), Author: \(author), Available: \(available) |"}
}

/// This struct contains the students who will be issuing out the books.
///     id: the id of the student as a UUID.
///     name: the name of the student.
///     age: the age of the student.
struct Student: CustomStringConvertible, Identifiable, Hashable {
    let id: UUID
    var name: String
    var age: Int
    var description: String {"| Name: \(name) Age: \(age) ID: \(id) |"}
}


/// This struct contains each request to issue a book from a student.
///     id: The id of the request for a student to issue a book.
///     studentID: the id of the student issuing the book.
///     bookID: the id of the book they are issuing.
struct Loan: Hashable, CustomStringConvertible, Identifiable, Equatable {
    let id: UUID
    let studentID: UUID
    let bookID: UUID
    let isReturned: Bool
    var description: String {"Studentid:  \(studentID) Bookid:  \(bookID) Returned: \(isReturned)"}
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
        var students = [
            Student(id: UUID(), name: "Dylan", age: 17)
        ]

        // Creates function used to convert optional strings, to integers.
        func stringToInt(string: String) -> Int {
            guard let intValue = Int(string) else {return 0}
            return intValue
        }

        // Creates booleans to use in while loops while the user is inputting information.
        var inputtingAge: Bool = true
        var inputting: Bool = true
        var codeRunning: Bool = true

        
        // Starts while loop the code runs inside, when the user ends the program, this loop is broken.
        while codeRunning == true {
            // Prints a message to start the program.
            print("Hello, welcome to the Onslow Book Borrowing System, how may we help you?, A: Add a book to the library? | B: Register a borrower/User? | C: End the program? | D: Issue a book to a student?" )
            // Variable for userEntry is put in an if let where it repeats the while loop if the userEnntry is null.
            if let userEntry = readLine(), !userEntry.isEmpty {

                // If the user wants to add a book to the library, this part of the code will run.
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
                    // This instance is added to the list of books.
                    books.append(Book(id: UUID(), bookTitle: userBookTitle, available: true, author: userBookAuthor))
                    print("The new list of available books is \(books)")
                }




                // If user enters b: This part of the code will deal with adding a new user to the list of students.
                if userEntry.lowercased() == "b" {

                    // Variables used later for getting the user's input.
                    var userAgeInput: String = ""
                    var userName: String = ""

                    // Asks what the new student's name is, doesn't allow it if user enters null.
                    print("What is the name of the student you're adding?")
                    guard let userName = readLine(), !userName.isEmpty else {
                        print("Name is required")
                        return
                    }

                    // Asks the new student's name, doesn't allow it if user enters null.
                    print("How old is the student?")
                    guard let userAgeInput = readLine(), !userAgeInput.isEmpty else {
                        print("Age is required")
                        return
                    }

                    //This block of code gets the user's age, it is done in a while loop to repeat if there is an error.
                    while inputtingAge == true {
                        inputtingAge = false
                        // Asks for the student's age, this is stored as an optional string.
                        print("How old is the student?")
                        guard let userAgeInput = readLine(), !userAgeInput.isEmpty else {
                            print("Age is required")
                            return
                        }
                        
                        // An if let statement is used to attempt to convert the optional string to an integer,
                        // If this is acheived, a new instance of a struct is created, if not, the while loop repeats.
                        if let userAge = Int(userAgeInput) {
                            print("The age you entered was \(userAge)")
                            students.append(Student(id: UUID(), name: userName, age: userAge))
                        } else {
                            print("Invalid input, please enter a whole number")
                            inputtingAge = true
                        }
                    }

                    // Prints the new list of students.
                    print("The new list of students is \(students)")
                }

                // If the user enters "c" the while loop breaks and the program ends.
                if userEntry.lowercased() == "c" {
                    break
                }

                // This part of the code runs when the user is issuing out a book.
                if userEntry.lowercased() == "d" {

                    // Prints the list of books for the user to choose from.
                    print(books)

                    // Starts a new while loop so the questions can be reasked if there is an incorrect input.
                    while inputting == true {
                        inputting = false

                        // Asks the user what boo they want, returns if the input is null.
                        print("Which book would you like to issue? type the number in the list of the book")
                        guard let bookChoiceInput = readLine(), !bookChoiceInput.isEmpty else {
                            print("a book choice is required")
                            return
                        }

                        // Uses an if let statement to change the optional string into an integer.
                        if let bookChoice = Int(bookChoiceInput) {
                            print("The choice you entered was \(bookChoice)")
                        } else {
                            print("Invalid input, please enter a whole number")
                            inputting = true
                        }
                    }
                }
                // This else is for the while loop for the initial userEntry.
            } else {
                print("Invalid input, please enter one of the letters corresponding to one of the menu options.")
                continue
            }
        }
    }
} 



