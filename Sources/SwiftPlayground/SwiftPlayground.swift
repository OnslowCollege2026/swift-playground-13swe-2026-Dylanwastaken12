import Foundation
import GRDB
struct Borrower: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int
    var givenName: String
    var familyName: String
    var email: String
    var borrowerType: String
    var yearLevel: Int
    var loanID: Int

    enum CodingKeys: String, CodingKey {
        case id = "BorrowerID"
        case givenName = "Given Name"
        case familyName = "Family Name"
        case email = "Email"
        case borrowerType = "Borrower Type"
        case yearLevel = "Year Level"
        case loanID = "LoanID"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let givenName = Column(CodingKeys.givenName)
        static let familyName = Column(CodingKeys.familyName)
        static let email = Column(CodingKeys.email)
        static let borrowerType = Column(CodingKeys.borrowerType)
        static let yearLevel = Column(CodingKeys.yearLevel)
        static let loanID = Column(CodingKeys.loanID)
    }
}

struct Loans: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int
    var dateOfIssue: String
    var dateOfReturn: String
    var dueDate: String

    enum CodingKeys: String, CodingKey {
        case id = "LoanID"
        case dateOfIssue = "Date of Issue"
        case dateOfReturn = "Date of Return"
        case dueDate = "Due Date"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let dateOfIssue = Column(CodingKeys.dateOfIssue)
        static let dateOfReturn = Column(CodingKeys.dateOfReturn)
        static let dueDate = Column(CodingKeys.dueDate)
    }
}

struct Items: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int
    var itemName: String
    var itemType: String
    var itemCondition: String
    var loanID: Int

    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case itemName = "Item Name"
        case itemType = "Item Type"
        case itemCondition = "Item Condition"
        case loanID = "LoanID"
    }

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let itemName = Column(CodingKeys.itemName)
        static let itemType = Column(CodingKeys.itemType)
        static let itemCondition = Column(CodingKeys.itemCondition)
        static let loanID = Column(CodingKeys.loanID)
    }
}

@main
struct SwiftPlayground {
    static func main() {
        let dbPath = "Sources/SwiftPlayground/Japanese-Item-tracking.db"

        var dbQueue: DatabaseQueue
        do {
            dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

        try dbQueue.read { db in
        let userBorrower = try Borrower
            .filter(Borrower.Columns.givenName == "Liam")
            .fetchOne}


        if let userBorrower {
            print("Found Borrower: \(userBorrower)")
        } else {
            print("No match for the given name")
        }

/*
        try dbQueue.read { db in
            let seniorBorrowers = try Borrower
                .filter(Borrower.Columns.yearLevel >= 12)
                .order(Borrower.Columns.givenName)
                .fetchAll(db)}

            print(seniorBorrowers)

        try dbQueue.read { db in
            let studentBorrowers = try Borrower
            .filter(
                Borrower.Columns.borrowerType == "Student"
            )
            .fetchOne(db)
            
        print(studentBorrowers as Any)
        } 
*/
        } catch {
            print(error)
            exit(1)
        }
    }
}
