import Foundation
import GRDB
struct Borrowers: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int?
    var givenName: String
    var familyName: String
    var email: String
    var borrowerType: String
    var yearLevel: String?


    enum CodingKeys: String, CodingKey {
        case id = "BorrowerID"
        case givenName = "Given Name"
        case familyName = "Family Name"
        case email = "Email"
        case borrowerType = "Borrower Type"
        case yearLevel = "Year Level"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let givenName = Column(CodingKeys.givenName)
        static let familyName = Column(CodingKeys.familyName)
        static let email = Column(CodingKeys.email)
        static let borrowerType = Column(CodingKeys.borrowerType)
        static let yearLevel = Column(CodingKeys.yearLevel)
    }
}

struct Loans: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int?
    var dateOfIssue: String
    var dateOfReturn: String?
    var dueDate: String
    let borrowerID: Int
    let itemID: Int

    enum CodingKeys: String, CodingKey {
        case id = "LoanID"
        case dateOfIssue = "Date of Issue"
        case dateOfReturn = "Date of Return"
        case dueDate = "Due Date"
        case borrowerID = "BorrowerID"
        case itemID = "ItemID"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let dateOfIssue = Column(CodingKeys.dateOfIssue)
        static let dateOfReturn = Column(CodingKeys.dateOfReturn)
        static let dueDate = Column(CodingKeys.dueDate)
        static let borrowerID = Column(CodingKeys.borrowerID)
        static let itemID = Column(CodingKeys.itemID)
    }
}

struct Items: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int?
    var itemName: String
    var itemType: String
    var itemCondition: String

    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case itemName = "Item Name"
        case itemType = "Item Type"
        case itemCondition = "Item Condition"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let itemName = Column(CodingKeys.itemName)
        static let itemType = Column(CodingKeys.itemType)
        static let itemCondition = Column(CodingKeys.itemCondition)
    }
}

@main
struct SwiftPlayground {
    static func main() {
        let dbPath = "Sources/SwiftPlayground/Japanese Item tracking.db"

        var dbQueue: DatabaseQueue
        do {
            dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

        try dbQueue.read { db in
        let userBorrower = try Borrowers
            .filter(Borrowers.Columns.givenName == "Liam")
            .fetchOne(db)

            if let userBorrower {
                print("Found Borrower: \(userBorrower)")
            } else {
                print("No match for the given name")
            }
        }
        // This try statement prints a list of senior borrowers, these borrowers are either staff or a year level higher than 11.
        try dbQueue.read { db in
            let seniorBorrowers = try Borrowers
                .filter(Borrowers.Columns.yearLevel == "12" || "13")
                .fetchAll(db)
            for borrower in seniorBorrowers {
                if borrower.yearLevel != nil {
                    print("Name: \(borrower.givenName), year level: \(borrower.yearLevel)")
                } else {
                    print("Name: \(borrower.givenName), year level: \(borrower.borrowerType)")
                }
                
            }
        }

        // This part writes to the database, but it needs to be changed so that the user can decide what the names, email and etc are. extra dbQueue.write statements should also be written so the user can add new items and make new loans
        try dbQueue.write { db in
            var newBorrower = Borrowers(id: nil, givenName: "Greg", familyName: "Greg", email: "ggreg@example.com",   borrowerType: "Student", yearLevel: "12")
            try newBorrower.insert(db)
            print(newBorrower)
        }

        try dbQueue.read { db in
            let activeLoans = try Loans
                .filter(Loans.Columns.dateOfReturn == nil)
                .fetchAll(db)
                // This works, it would just be better to print out the loans in a more ordered way.
                print(activeLoans)
        }

        } catch {
            print("The error that happened is: \(error)")
            exit(1)
        }
    }
}
