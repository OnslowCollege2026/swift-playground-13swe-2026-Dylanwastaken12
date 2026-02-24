// The Swift Programming Language
// https://docs.swift.org/swift-book



// task A convert open functions to methods

// creates a struct that contains info about a given book
struct Book {
    let title: String
    let author: String
    let pages: Int

    // this function prints a summary about the given book
    func summary() -> String {
            return "the book titled \(title) is written by \(author) and is \(pages) pages long"
        }
}

// Task B: Temperature:

struct Temperature {
    static func toFarenheit(celsius: Double) -> Double {
        return celsius * (9/5) + 32
    }
    static func toCelsius(farenheit: Double) -> Double {
        return (farenheit - 32) * (5/9)
    }
}
@main

struct SwiftPlayground {
    static func main() {
        // creates two book instances 
        let bookOne = Book(title: "Wool", author: "Hugh Howey", pages: 397)
        let bookTwo = Book(title: "Shift", author: "Hugh Howey", pages: 431)

        // prints info about both book instances
        print(bookOne.summary())
        print(bookTwo.summary())

        // Task B: temperature:

        print("22 degrees celsius converted to farenheit is \(Temperature.toCelsius(farenheit: 22))")

        print("67 degrees farenheit converted to celsius is \(Temperature.toCelsius(farenheit: 67))")






    }
}
