// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import GRDB

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
