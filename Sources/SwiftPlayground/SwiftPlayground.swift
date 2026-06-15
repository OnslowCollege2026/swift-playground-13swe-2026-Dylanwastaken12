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

    let borrowerID: Int
    var givenName: String
    var familyName: String
    var email: String
    var BorrowerType: String
    var yearLevel: Int
    var loanID: Int
}

struct Loans: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let loanID: Int
    var dateOfIssue: String
    var dateOfReturn: String
    var dueDate: String
}

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")
    }
}
