// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
@main

// SchoolSystem Task.


struct SwiftPlayground {
    static func main() {
        
        
        do {
            let enrolment = Enrolment(studentID: 22774, courseID: 70968)
            let data = try JSONEncoder().encode(enrolment)
            let decoded = try JSONDecoder().decode(Enrolment.self, from: data)
            print(data)
            print(decoded)
        } catch {
            print("Error: \(error)")
        }
        

        
    }
}

// Creates a struct for student that uses the protocol "Identifiable" and stores id, name, and age.
struct Student: Identifiable {
    let id: String
    var name: String
    let age: Int
}

// Creates a struct called course that uses the protocol CustomStringConvertable
struct Course: CustomStringConvertible {
    let id: String
    var title: String
    var courseDescription: String

    var description: String {
        """
        --- \(title)---
        CourseID: \(id)
        \(courseDescription)
        """
    }
}

struct Enrolment: Codable {
    let studentID: Int
    let courseID: Int
}


