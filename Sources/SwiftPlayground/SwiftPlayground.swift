// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import GRDB

/// Represents an item in the menu.
struct Item: Identifiable, Codable, FetchableRecord, PersistableRecord {

    /// The id of the item.
    let id: Int

    /// The name of the item.
    var name: String

    /// The price of the item.
    var price: Double

/// CodingKeys syncs the variables to the database.
    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case name = "Name"
        case price = "Price"
    }
}

/// Represents an order made by the purchaser.
struct Order: Identifiable, Codable, FetchableRecord, PersistableRecord {

    /// The id of the order.
    let id: Int

    /// The id of the purchaser of the order.
    let purchaserid: Int

    /// The amount ordered.
    var amount: Int

/// CodingKeys syncs the variables to the database.
    enum CodingKeys: String, CodingKey {
        case id = "ItemID"
        case purchaserid = "purchaserID"
        case amount = "Amount"
    }
}

/// Used to avoid the many-to-many relationship between the Item table and Order table.
struct OrderLine: Codable, FetchableRecord, PersistableRecord {

    /// The id of the order.
    let orderid: Int

    /// The id of the item.
    let itemid: Int

    /// The quantity of items ordered.
    var quantity: Int

/// CodingKeys syncs the variables to the database.
    enum CodingKeys: String, CodingKey {
        case orderid = "OrderID"
        case itemid = "ItemID"
        case quantity = "Quantity"
    }
}

/// Represents the purchaser of the order.
struct Purchaser: Identifiable, Codable, FetchableRecord, PersistableRecord, TableRecord {

    /// The id of the purchaser.
    let id: Int

    /// The name of the purchaser.
    var name: String

    /// The number of people in the purchaser's group.
    var count: Int

    /// The table of the purchaser.
    var reservedTable: String

/// CodingKeys syncs the variables to the database.
    enum CodingKeys: String, CodingKey {
        case id = "PurchaserID"
        case name = "Name"
        case count = "Count"
        case reservedTable = "ReservedTable"
    }
    enum Columns {
        static let name = Column(CodingKeys.name)
        static let count = Column(CodingKeys.count)
        static let reservedTable = Column(CodingKeys.reservedTable)
    }
}

@main
struct SwiftPlayground {
    static func main() {

        // Links to the database.
        let dbPath = "Sources/SwiftPlayground/cafe.db"
        do {
            let dbQueue = try DatabaseQueue(path: dbPath)
            print("database connection succesful")

            // Dumps schema.
            try? dbQueue.read { db in
                try db.dumpSchema()
            }

            // Searches the database for any purchasers with the id "purchaserId"
            let purchaserId: Int = 2
            try? dbQueue.read { db in
                let purchaser = try Purchaser.fetchOne(db, key: purchaserId)
                if let purchaser {
                    print("Found purchaser with id '2': \(purchaser.name)")
                } else {
                    print("No purchaser with id '2' \(purchaserId)")
                }
            }

            // Searches the database for the item with id "1"
            try dbQueue.read {db in
                let item = try Item.fetchOne(db, id: 1)
                if let item {
                    print(item)
                } else {
                    print("couldn't find an item with that id")
                }
            }

            // Searches the database for anyone with the name "Matua Doc"
            try dbQueue.read { db in
                let filteredPurchaser = try Purchaser
                    .filter(Purchaser.Columns.name == "Matua Doc")
                    .fetchOne(db)
                
                if let filteredPurchaser {
                    print("Found by name: \(filteredPurchaser)")
                } else {
                    print("No match for name Matua Doc")
                }
            }

            // Searches the database for purchasers with groups larger than 15, the orders them by name.
            try dbQueue.read { db in
                let largeGroups = try Purchaser
                    .filter(Purchaser.Columns.count >= 15)
                    .order(Purchaser.Columns.name)
                    .fetchAll(db)
                    
                for purchaser in largeGroups {
                    print("\(purchaser.name) has a group size of \(purchaser.count)")
                }
            }

            try dbQueue.read { db in
                if let order = try Order.fetchOne(db, id: 1), let purchaser = try Purchaser.fetchOne(db, id: order.purchaserid) {
                    print("Order #\(order.id) for \(purchaser.name) --- $\(order.amount)")
                }
            }

        // Errors are caught here.
        } catch {
            print("Database error: \(error)")
        }
    }
}
