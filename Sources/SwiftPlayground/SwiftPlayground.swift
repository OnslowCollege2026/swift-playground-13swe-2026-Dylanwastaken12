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
            print("The encoded data looks like: \(data)")
            print("The decoded data looks like: \(decoded)")
        } catch {
            print("Error: \(error)")
        }
        
        // creates a list of student ID's and scores
        let scores: [ScoreEntry] = [
            ScoreEntry(studentID: 26396, points: 127),
            ScoreEntry(studentID: 22774, points: 856),
            ScoreEntry(studentID: 24249, points: 645)
        ]

        // sorts the instances by the number of points
        for item in scores.sorted() {
            print(item)
        }

        let foo: Enrolment = Enrolment(studentID: 0, courseID: 17)
        print(foo.hashValue)
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


struct Enrolment: Codable, Hashable {
    let studentID: Int
    let courseID: Int

    func hash(into hasher: inout Hasher) {
        // hasher.combine(studentID)
        // hasher.combine(courseID)

        hasher.combine("\(studentID).\(courseID)")
    }
}

// creates a struct that enters scores and student ID's
struct ScoreEntry: Comparable, CustomStringConvertible, Equatable {
    let studentID: Int
    var points: Int

    var description: String {
        return "Student: \(studentID) has \(points) points"
    }

    static func < (lhs: ScoreEntry, rhs: ScoreEntry) -> Bool {
        lhs.points < rhs.points
    }
}