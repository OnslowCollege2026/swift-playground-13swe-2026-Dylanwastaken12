// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import GRDB

struct Item: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let id: Int
    var name: String
    var price: Double

    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case name = "Name"
        case price = "Price"
    }
}

struct Order: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let id: Int
    let purchaserid: Int
    var amount: Int

    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case purchaserid = "purchaserID"
        case amount = "Amount"
    }
}

struct OrderLine: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let orderid: Int
    let itemid: Int
    var quantity: Int

    enum CodingKeys: String, CodingKey {
        case orderid = "OrderID"
        case itemid = "ItemID"
        case quantity = "Quantity"
    }
}

struct Purchaser: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let id: Int
    var name: String
    var count: Int
    var reservedtable: String

    enum CodingKeys: String, CodingKey {
        case id = "PurchaserID"
        case name = "Name"
        case count = "Count"
        case reservedtable = "ReservedTable"
    }
}

@main
struct SwiftPlayground {
    static func main() {
        let dbPath = "Sources/SwiftPlayground/cafe.db"
        do {
            let dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")
        } catch {
            print("Database error: \(error)")
        }
    }
}
