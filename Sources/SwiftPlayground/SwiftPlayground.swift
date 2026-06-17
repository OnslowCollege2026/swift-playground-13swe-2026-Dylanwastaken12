// The Swift Programming Language
// https://docs.swift.org/swift-book
/*
struct Customer: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int

    var givenName: String
    var familyName: String

    var homePhone: String
    var workPhone: String
    var mobilePhone: String
    var email: String

    var address: String
    var region: String
    var city: String
    var country: String

    enum CodingKeys: String, CodingKey {
        case id = "CustomerID"
        case givenName = "Given Name"
        case familyName = "Family Name"
        case homePhone = "Home Phone"
        case workPhone = "Work Phone"
        case mobilePhone = "Mobile Phone"
        case email = "Email"
        case address = "Address"
        case region = "Region"
        case city = "City"
        case country = "Country"
    }
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let givenName = Column(CodingKeys.givenName)
        static let familyName = Column(CodingKeys.familyName)
        static let homePhone = Column(CodingKeys.homePhone)
        static let workPhone = Column(CodingKeys.workPhone)
        static let mobilePhone = Column(CodingKeys.mobilePhone)
        static let email = Column(CodingKeys.email)
        static let address = Column(CodingKeys.address)
        static let region = Column(CodingKeys.region)
        static let city = Column(CodingKeys.city)
        static let country = Column(CodingKeys.country)
    }
}
*/

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
}

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")
    }
}
