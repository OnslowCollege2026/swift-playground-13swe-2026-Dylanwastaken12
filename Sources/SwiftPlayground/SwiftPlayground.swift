// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import GRDB

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
struct Staff: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int

    var givenName: String
    var familyName: String

    var workPhone: String
    var mobilePhone: String
    var workEmail: String

    var jobTitle: String

    var airportCode: Int

    enum CodingKeys: String, CodingKey {
        case id = "StaffID"
        case givenName = "Given Name"
        case familyName = "Family Name"
        case workPhone = "Work Phone"
        case mobilePhone = "Mobile Phone"
        case workEmail = "Work Email"
        case jobTitle = "Job Title"
        case airportCode = "AirportCode"
    }
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let givenName = Column(CodingKeys.givenName)
        static let familyName = Column(CodingKeys.familyName)
        static let workPhone = Column(CodingKeys.workPhone)
        static let mobilePhone = Column(CodingKeys.mobilePhone)
        static let workEmail = Column(CodingKeys.workEmail)
        static let jobTitle = Column(CodingKeys.jobTitle)
        static let airportCode = Column(CodingKeys.airportCode)
    }
}

struct Booking: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int

    var customerID: Int

    var staffID: Int

    let passengerCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "BookingID"
        case customerID = "CustomerID"
        case staffID = "StaffID"
        case passengerCount = "Passenger Count"
    }
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let customerID = Column(CodingKeys.customerID)
        static let staffID = Column(CodingKeys.staffID)
        static let passengerCount = Column(CodingKeys.passengerCount)
    }
}

struct Location: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: Int

    let airportCode: Int

    let airportName: String

    let airportAdress: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case airportCode = "AirportCode"
        case airportName = "Airport Name"
        case airportAdress = "Airport Adress"
    }
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let airportCode = Column(CodingKeys.airportCode)
        static let airportName = Column(CodingKeys.airportName)
        static let airportAdress = Column(CodingKeys.airportAdress)
    }
}

struct Passenger: Codable, FetchableRecord, PersistableRecord {

    let flightID: Int

    let seatNumber: Int

    let isMinor: Bool

    let bookingID: Int

    enum CodingKeys: String, CodingKey {
        case flightID = "FlightID"
        case seatNumber = "Seat Number"
        case isMinor = "is Minor"
        case bookingID = "BookingID"
    }
    enum Columns {
        static let flightID = Column(CodingKeys.flightID)
        static let seatNumber = Column(CodingKeys.seatNumber)
        static let isMinor = Column(CodingKeys.isMinor)
        static let bookingID = Column(CodingKeys.bookingID)
    }
}

struct Flight: Codable, FetchableRecord, PersistableRecord {

    let flightID: Int

    var departureTime: String

    let planeID: Int

    let departureLocation: String

    let destinationLocation: String

    enum CodingKeys: String, CodingKey {
        case flightID = "FlightID"
        case departureTime = "Departure Time"
        case planeID = "PlaneID"
        case departureLocation = "Departure Location"
        case destinationLocation = "Destination Location"
    }
    enum Columns {
        static let flightID = Column(CodingKeys.flightID)
        static let departureTime = Column(CodingKeys.departureTime)
        static let planeID = Column(CodingKeys.planeID)
        static let departureLocation = Column(CodingKeys.departureLocation)
        static let destinationLocation = Column(CodingKeys.destinationLocation)
    }
}

struct Plane: Codable, FetchableRecord, PersistableRecord {

    let planeID: Int

    let model: String

    let minRunwayLength: Int

    let maxWeight: Int

    let capacity: Int

    enum CodingKeys: String, CodingKey {
        case planeID = "PlaneID"
        case model = "Model"
        case minRunwayLength = "Min Runway Length"
        case maxWeight = "Max Weight"
        case capacity = "Capacity"
    }
    enum Columns {
        static let planeID = Column(CodingKeys.planeID)
        static let model = Column(CodingKeys.model)
        static let minRunwayLength = Column(CodingKeys.minRunwayLength)
        static let maxWeight = Column(CodingKeys.maxWeight)
        static let capacity = Column(CodingKeys.capacity)
    }
}

struct Seat: Codable, FetchableRecord, PersistableRecord {

    let seatID: Int

    let planeID: Int

    let seatClass: String

    let emergency: Bool

    enum CodingKeys: String, CodingKey {
        case seatID = "SeatID"
        case planeID = "PlaneID" 
        case seatClass = "Seat Class"
        case emergency = "Emergency"
    }
    enum Columns {
        static let seatID = Column(CodingKeys.seatID)
        static let planeID = Column(CodingKeys.planeID)
        static let seatClass = Column(CodingKeys.seatClass)
        static let emergency = Column(CodingKeys.emergency)
    }
}

struct Runway: Codable, FetchableRecord, PersistableRecord {

    let runwayID: Int
    
    let length: Int

    let airportCode: String

    let type: String

    enum CodingKeys: String, CodingKey {
        case runwayID = "RunwayID"
        case length = "Length"
        case airportCode = "AirportCode"
        case type = "Type"
    }
    enum Columns {
        static let runwayID = Column(CodingKeys.runwayID)
        static let length = Column(CodingKeys.length)
        static let airportCode = Column(CodingKeys.airportCode)
        static let type = Column(CodingKeys.type)
    }
}

func insertValue<T: PersistableRecord>(into dbQueue: DatabaseQueue, _ value: T) {
    do {
        try dbQueue.write { db in
            try value.insert(db)
        }
    } catch let error {
        print("Error inserting into the database: \(error)")
    }
}


@main
struct SwiftPlayground {
    static func main() {
        let dbPath = "Sources/SwiftPlayground/Flight-Booking.sqlite"

        var dbQueue: DatabaseQueue
        do {
            dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

        } catch {
            print(error)
        }

        try dbQueue.read { db in
            let customer = try Customer
            .filter(Customer.Columns.givenName == "Mei".databaseValue)
            .fetchOne(db)}






        /*
        var tables = [
            "1: Locations",
            "2: Plane",
            "3: Customers",
            "4: Runways",
            "5: Seats",
            "6: Flights",
            "7: Staff",
            "8: Bookings",
            "9: Passengers",
        ]

        let dbPath = "Sources/SwiftPlayground/Flight-Booking.sqlite"

        var dbQueue: DatabaseQueue?
        do {
            dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

        } catch {
            print(error)
        }

        guard let dbQueue else {exit(1)}

        print(tables)
        print("What table would you like to enter data into.")

        var userChoice = readLine()

        switch userChoice {
            case "1": dbQueue.
        */
        
        }
    }



/*
Locations
Plane
Customers
Runways
Seats
Flights
Staff
Bookings
Passengers
*/
