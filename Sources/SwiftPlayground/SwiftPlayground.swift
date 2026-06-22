import Foundation
import GRDB
struct Borrowers: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int
    var givenName: String
    var familyName: String
    var email: String
    var borrowerType: String
    var yearLevel: Int


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

    let id: Int
    var dateOfIssue: String
    var dateOfReturn: String
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

    let id: Int
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
/*
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
*/

        try dbQueue.read { db in
            let seniorBorrowers = try Borrowers
                .filter(Borrowers.Columns.yearLevel == "12" || "13")
                .fetchAll(db)
            
            print(seniorBorrowers)
        }

        } catch {
            print(error)
            exit(1)
        }
    }
}
