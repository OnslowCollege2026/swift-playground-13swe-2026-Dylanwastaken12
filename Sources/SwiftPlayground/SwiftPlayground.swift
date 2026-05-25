// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import GRDB

struct Customer: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: UUID

    var givenName: String
    var familyName: String

    var homePhone: String
    var workPhone: String
    var mobilePhone: String
    var email: String

    var adress: String
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
        case adress = "Adress"
        case region = "Region"
        case city = "City"
        case country = "Country"
    }
}

struct Staff: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: UUID

    var givenName: String
    var familyName: String

    var workPhone: String
    var mobilePhone: String
    var workEmail: String

    var jobTitle: String

    var airportCode: UUID

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
}

struct Booking: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: UUID

    var customerID: UUID

    var staffID: UUID

    let passengerCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "BookingID"
        case customerID = "CustomerID"
        case staffID = "StaffID"
        case passengerCount = "Passenger Count"
    }
}

struct Location: Identifiable, Codable, FetchableRecord, PersistableRecord {

    let id: UUID

    let airportCode: Int

    let airportName: String

    let airportAdress: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case airportCode = "AirportCode"
        case airportName = "Airport Name"
        case airportAdress = "Airport Adress"

    }
}

struct Passenger: Codable, FetchableRecord, PersistableRecord {

    let flightID: UUID

    let seatNumber: UUID

    let isMinor: Bool

    let bookingID: UUID

    enum CodingKeys: String, CodingKey {
        case flightID = "FlightID"
        case seatNumber = "Seat Number"
        case isMinor = "is Minor"
        case bookingID = "BookingID"
    }
}

struct Flight: Codable, FetchableRecord, PersistableRecord {

    let flightID: UUID

    var departureTime: String

    let planeID: UUID

    let departureLocation: String

    let destinationLocation: String

    enum CodingKeys: String, CodingKey {
        case flightID = "FlightID"
        case departureTime = "Departure Time"
        case planeID = "PlaneID"
        case departureLocation = "Departure Location"
        case destinationLocation = "Destination Location"
    }
}

struct Plane: Codable, FetchableRecord, PersistableRecord {

    let planeID: UUID

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
}

struct Seat: Codable, FetchableRecord, PersistableRecord {

    let seatID: UUID

    let planeID: UUID

    let seatClass: String

    let emergency: Bool

    enum CodingKeys: String, CodingKey {
        case seatID = "SeatID"
        case planeID = "PlaneID" 
        case seatClass = "Seat Class"
        case emergency = "Emergency"
    }
}

struct Runway: Codable, FetchableRecord, PersistableRecord {

    let runwayID: UUID
    
    let length: Int

    let airportCode: String

    let type: String

    enum CodingKeys: String, CodingKey {
        case runwayID = "RunwayID"
        case length = "Length"
        case airportCode = "AirportCode"
        case type = "Type"
    }
}


@main
struct SwiftPlayground {
    static func main() {
        let dbPath = "Sources/SwiftPlayground/Flight-Booking.db"
        do {
            let dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

            try? dbQueue.read { db in
                try db.dumpSchema()
            }
        } catch {
            print(error)
        }
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