import Foundation
import GRDB
struct Borrowers: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int?
    var givenName: String
    var familyName: String
    var email: String
    var borrowerType: String
    var yearLevel: String?

    func summary() -> String {
        "Borrower: \(givenName) \(familyName) has the email: \(email) and is a \(borrowerType)"
    }


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
        var dataEntry = true
        var userYearLevel: String? = nil

        var dbQueue: DatabaseQueue
        do {
            dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")
/*
        TEST READING FROM THE DATABASE

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
            while dataEntry == true {
                dataEntry = false
                print("What is the first name of the Borrower you are adding?")
                guard let userBorrowerFirstName = readLine(), !userBorrowerFirstName.isEmpty else {
                    print("First Name is required")
                    dataEntry = false
                    continue
                }

                print("What is the last name of the Borrower you are adding?")
                guard let userBorrowerLastName = readLine(), !userBorrowerLastName.isEmpty else {
                    print("Last name is required")
                    dataEntry = false
                    continue
                }

                print("What is the email address of the Borrower you are adding?")
                guard let userBorrowerEmail = readLine(), !userBorrowerEmail.isEmpty else {
                    print("Email is required")
                    dataEntry = false
                    continue
                }

                print("Is the borrower a Student or a Staff? Enter 1, if they are a Student, enter 2, if they are Staff.")
                guard let userBorrowerType = readLine(), !userBorrowerType.isEmpty else {
                    print("Borrower type is required")
                    dataEntry = false
                    continue
                }

                if userBorrowerType == "1" {
                    print("What is the year level of the Student? Year level should be between 9 and 13")
                    guard var userYearLevel = readLine(), ["9", "10", "11", "12", "13"].contains(userYearLevel) else {
                        print("Year level should be a number between 9 and 13")
                        dataEntry = false
                        continue
                    }
                } else if userBorrowerType == "2" {
                    userYearLevel = nil
                } else {
                    dataEntry = true
                }

                try dbQueue.write { db in
                    var newBorrower = Borrowers(id: nil, givenName: userBorrowerFirstName, familyName: userBorrowerLastName, email: userBorrowerEmail,   borrowerType: userBorrowerType, yearLevel: userYearLevel)
                    try newBorrower.insert(db)

                    let borrowerList = try Row.fetchAll(db, sql: "SELECT * FROM Borrowers")
                    for borrower in borrowerList {
                        print(borrower)
                    }
                }
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
