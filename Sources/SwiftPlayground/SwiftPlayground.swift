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
///     isReturned: a true or false as to whether the book has been returned to the library yet
///     bookTitle: the title of the issued book.
struct Loan: Hashable, CustomStringConvertible, Identifiable, Equatable {
    let id: UUID
    let studentID: UUID
    let bookID: UUID
    let isReturned: Bool
    let bookTitle: String
    var description: String {"Book Title: \(bookTitle) Studentid:  \(studentID) Bookid:  \(bookID) Returned: \(isReturned)"}
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
            Student(id: UUID(), name: "Dylan", age: 17),
            Student(id: UUID(), name: "Alex", age: 15)
        ]

        // Creates array to store a list of loans.
        var loans = [
            Loan(id: UUID(), studentID: UUID(), bookID: books[1].id, isReturned: false, bookTitle: books[1].bookTitle),
            Loan(id: UUID(), studentID: UUID(), bookID: books[4].id, isReturned: false, bookTitle: books[4].bookTitle)
        ]

        // Creates booleans to use in while loops while the user is inputting information.
        var inputtingAge: Bool = true
        var inputtingBorrower: Bool = true
        var codeRunning: Bool = true
        var inputtingBook: Bool = true
        var inputtingReturn: Bool = true
        var inputtingSearch: Bool = true

        
        // Starts while loop the code runs inside, when the user ends the program, this loop is broken.
        while codeRunning == true {
            // Prints a message to start the program.
            print("""
            Hello, welcome to the Onslow Book Borrowing System, how may we help you, 
            | A: Add a book to the library
            | B: Register a borrower/User
            | C: End the program
            | D: Issue a book to a student from the list of students
            | E: Return a Book to the library
            | F: Search for a student
            """)
            // Variable for userEntry is put in an if let where it repeats the while loop if the userEnntry is null.
            if let userEntry = readLine(), !userEntry.isEmpty, userEntry.count <= 1 {

                // If the user wants to add a book to the library, this part of the code will run.
                if userEntry.lowercased() == "a" {
                    repeat{
                        inputtingBook = false
                        // Creates variables which are used for user input for title and author.
                        let userBookTitle: String = ""
                        let userBookAuthor: String = ""

                        // Asks user what the title is, value is returned if the input is null, their choice is then printed.
                        print("What is the name of the book?")
                        guard let userBookTitle = readLine(), !userBookTitle.isEmpty, userBookTitle.count < 30 else {
                            print("Book Title is required, or is too long.")
                            inputtingBook = true
                            continue 
                        }
                        print("Your book title is \(userBookTitle)")

                        // Asks the user who the author of the book is, 
                        // value is returned if input is null, their choice is then printed.
                        print("Who is the author?")
                        guard let userBookAuthor = readLine(), !userBookAuthor.isEmpty, userBookAuthor.count < 15 else {
                            print("Book Author is required, or is too long")
                            inputtingBook = true
                            continue
                        }
                        print("Your author is \(userBookAuthor)")

                        // Creates a new instance of the "Book" Struct using the variables aquired from user input,
                        // This instance is added to the list of books.
                        books.append(Book(id: UUID(), bookTitle: userBookTitle, available: true, author: userBookAuthor))
                        print("The new list of available books is \(books)")
                    } while inputtingBook == true
                }




                // If user enters b: This part of the code will deal with adding a new user to the list of students.
                if userEntry.lowercased() == "b" {

                    // Variables used later for getting the user's input.
                    var userAgeInput: String
                    var userName: String

                    repeat {
                        inputtingBorrower = false
                        // Asks what the new student's name is, doesn't allow it if user enters null.
                        print("What is the name of the student you're adding?")
                        // Uses guard let to avoid a null input.
                        guard let userName = readLine(), !userName.isEmpty, userName.count < 15 else {
                            print("Name is required, or is too long")
                            inputtingBorrower = true
                            continue
                        }
                        
                        // Asks the new student's name, doesn't allow it if user enters null.
                        print("How old is the student?")
                        guard let userAgeInput = readLine(), !userAgeInput.isEmpty else {
                            print("Age is required")
                            inputtingBorrower = true
                            continue 
                        }
                        if let userAge = Int(userAgeInput), userAge <= 0 {
                            print("The age you entered was \(userAge)")
                            students.append(Student(id: UUID(), name: userName, age: userAge))
                        } else {
                            inputtingBorrower = true
                            print("Invalid input")
                            continue
                        }
                    } while inputtingBorrower

                    // Prints the new list of students.
                    print("The new list of students is \(students)")
                }
                

                // If the user enters "c" the while loop breaks and the program ends.
                if userEntry.lowercased() == "c" {
                    break
                }

                // This part of the code runs when the user is issuing out a book.
                if userEntry.lowercased() == "d" {
                    // Resets the boolean used for the while loops in case it has been set to false.
                    inputtingBorrower = true

                    // Counts how many available books there are.
                    let bookCount: Int = books.reduce(0) { $0 + ($1.available ? 1 : 0)}

                    // Makes a list using .filter of all available books.
                    let availableBooks = books.filter { book in
                        return book.available}
                    
                    // This print statement is here to show the user what they 
                    print(" There are \(bookCount) Available books: \(availableBooks)")

                    // Loops until there is a correct input.
                    while inputtingBorrower == true {
                        inputtingBorrower = false

                        // Asks the user what book they want, returns if the input is null.
                        print("Which book would you like to issue? type the number in the list of the book")
                        guard let bookChoiceInput = readLine(), !bookChoiceInput.isEmpty else {
                            print("a book choice is required")
                            inputtingBorrower = true
                            continue
                        }

                        // Prints a list of students for the user.
                        print(students)

                        // Asks user which student they are issuing as, returns if input is null.
                        print("Which student would you like to issue the book to? type the number in the list of the student.")
                        guard let studentChoiceInput = readLine(), !studentChoiceInput.isEmpty else {
                            print("a student choice is required")
                            inputtingBorrower = true
                            continue
                        }

                        // Uses an if let statement to check if both optional statements can be converted into integers.
                        if let bookChoiceNum = Int(bookChoiceInput), let studentChoiceNum = Int(studentChoiceInput) {

                            // Makes a new variable containing the user's chosen book.
                            let bookChoice = availableBooks[bookChoiceNum - 1]
                            print("The choice you entered was \(bookChoice)")

                            // Makes a new variable containing the user's chosen student.
                            let studentChoice = students[studentChoiceNum - 1]
                            print("The student you entered was \(studentChoice)")

                            // Adds both new variables into a new intance of the "Loan" struct, 
                            // this is then added to the loans list.
                            loans.append(Loan(id: UUID(), studentID: studentChoice.id, bookID: bookChoice.id, 
                                isReturned: false, bookTitle: bookChoice.bookTitle))
                        } else {

                            // If the user's input for any of the questions is invalid, the while loops restarts.
                            print("Invalid input")
                            inputtingBorrower = true
                        }
                        // Prints the list of loans after the user's loan has been added.
                        print("The list of loans now looks like: \(loans)")
                    }
                }

                // This is for handling returns of books, and deleating them from the "loans" array.
                if userEntry.lowercased() == "e" {
                    inputtingReturn = true

                    // Prints current list of active loans for the user to look at.
                    print("The current list of loans is: \(loans)")

                    // Starts a while loop that is restarted should any errors occur.
                    while inputtingReturn == true {
                        inputtingReturn = false

                        // Asks what loaned book the user would like to return, guard let handles null inputs.
                        print("Which issued book would you like to return? type the number in the list of loaned book.")
                        guard let loanChoiceInput = readLine(), !loanChoiceInput.isEmpty else {
                            print("A choice of loan is required")
                            inputtingReturn = true
                            continue
                        }

                        // Converts the optional string to an integer to remove the loan at a given point in the array.
                        // Errors and handled using an if let statement.
                        if let loanChoiceNum = Int(loanChoiceInput) {
                            let loanChoice = loans[loanChoiceNum - 1 ]
                            print("The loan you chose was \(loanChoice)")
                            loans.remove(at: loanChoiceNum - 1)
                        } else {
                            print("Invalid input")
                            inputtingReturn = true
                            continue
                        }
                    }
                }

                // Handles user search for specific student names.
                if userEntry.lowercased() == "f" {
                    inputtingSearch = true

                    // Creates a while loop to repeat if there are errors in the user entry
                    while inputtingSearch == true {
                        inputtingSearch = false
                        print("The list of students is: \(students)")
                        print("type the name of the student you would like to find, (Case sensitive)")

                        // Creates a variable holding the user input for their search.
                        guard let userSearch = readLine(), !userSearch.isEmpty else {
                            print("invalid input")
                            inputtingSearch = true
                            continue
                        }

                        // Filters the list of students for anyone with that name
                        let userStudentSearch = students.filter { student in
                            return student.name == userSearch}

                        // Prints the searched for student is a student matches the given name.
                        if !userStudentSearch.isEmpty {
                            print("There is a user matching that name: \(userStudentSearch)")
                        } else {
                            print("There are no students matching that name")
                        }
                    }
                }
                // This else is for the while loop for the initial userEntry.
            } else {
                print("Invalid input, please enter one of the letters corresponding to one of the menu options.")
                continue
            }
        }

        // End of program message.
        print("Thanks for using the Onslow Book Borrowing System.")
    }
} 