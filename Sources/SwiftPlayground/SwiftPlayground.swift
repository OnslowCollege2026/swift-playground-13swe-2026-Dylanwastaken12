// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
@main

// SchoolSystem Task.


struct SwiftPlayground {
    static func main() {
        
        // This do catch encodes and decodes enrolements while catching errors, using JSON
        do {
            let enrolment = Enrolment(studentID: UUID(), courseID: UUID())
            let data = try JSONEncoder().encode(enrolment)
            let decoded = try JSONDecoder().decode(Enrolment.self, from: data)
            print("The encoded data looks like: \(data)")
            print("The decoded data looks like: \(decoded)")
        } catch {
            print("Error: \(error)")
        }
        
        // Creates a list of student ID's and scores.
        let scores: [ScoreEntry] = [
            ScoreEntry(studentID: UUID(), points: 127),
            ScoreEntry(studentID: UUID(), points: 856),
            ScoreEntry(studentID: UUID(), points: 645)
        ]

        // Sorts the instances by the number of points.
        for item in scores.sorted() {
            print(item)
        }

        // Creates two students Stan & Jules.
        let stan = Student(id: UUID(), name: "Stan", age: 17)
        let jules = Student(id: UUID(), name: "Jules", age: 16)

        // Creates a course for 13SWE.
        let softwareEng = Course(title: "13SWE", id: UUID(), courseDescription: "Sweet Food in Hospitality")

        // Enroles both Stan and Jules in  13SWEusing the enrolement struct.
        let julesInSWE: Enrolment = Enrolment(studentID: jules.id, courseID: softwareEng.id)
        let stanInSWE: Enrolment = Enrolment(studentID: stan.id, courseID: softwareEng.id)

        // This do catch encodes and decodes the enrolements for Stan and Jules using JSON while catching errors.
        do {
            let julesInSWEEncoded = try JSONEncoder().encode(julesInSWE)
            let julesInSWEDecoded = try JSONDecoder().decode(Enrolment.self, from: julesInSWEEncoded)

            print(julesInSWEDecoded.hashValue)
        } catch {
            print("Error: \(error)")
        }
        let stanInSWE2: Enrolment = Enrolment(studentID: stan.id, courseID: softwareEng.id)

        // Creates a set for the created enrolements.
        let enrolements: Set = [
            julesInSWE,
            stanInSWE,
            stanInSWE2
        ]

        // Prints the set of enrolements for Stan and Jules.
        print(enrolements)

        // Creates score entries for Stan and Jules giving them unique amounts of points.
        let julesScoreEntry = ScoreEntry(studentID: jules.id, points: 55)
        let stanScoreEntry = ScoreEntry(studentID: stan.id, points: 50)

        // Adds the score entries to an array, then sorts them by scores, lowest to highest, then prints them.
        let scoreEntries: [ScoreEntry] = [julesScoreEntry, stanScoreEntry]
        print(scoreEntries.sorted())

        // Creates a new student called Ash.
        let ash = Student(id: UUID(), name: "Ash", age: 18)
        
        // Creates a score entry for Ash with the same points as jules.
        let ashScoreEntry = ScoreEntry(studentID: ash.id, points: 55)

        // Prints a boolean about whether Ash's score is equal to Jules' 
        print(ashScoreEntry == julesScoreEntry)
    }
}

// Creates a struct for student that uses the protocol "Identifiable" and stores id, name, and age.
struct Student: Identifiable {
    let id: UUID
    var name: String
    let age: Int
}

// Creates a struct called course that uses the protocol CustomStringConvertable
struct Course: CustomStringConvertible {
    var title: String
    let id: UUID
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
    let studentID: UUID
    let courseID: UUID

    func hash(into hasher: inout Hasher) {
        hasher.combine("\(studentID).\(courseID)")
    }
}

// Creates a struct that enters scores and student ID's.
struct ScoreEntry: Comparable, CustomStringConvertible, Equatable {
    let studentID: UUID
    var points: Int

    var description: String {
        return "Student: \(studentID) has \(points) points"
    }

    // These func compare lhs and rhs to produce booleans.
    static func < (lhs: ScoreEntry, rhs: ScoreEntry) -> Bool {
        lhs.points < rhs.points
    }

    static func == (lhs: ScoreEntry, rhs: ScoreEntry) -> Bool {
        lhs.points == rhs.points
    }
}