// The Swift Programming Language
// https://docs.swift.org/swift-book


//Practice Task Students:

// struct is created for students showing their information
struct Student {
    let ID: Int
    var name: String
    let NSN: Int
    var email: String
    var age: Int

    // This function prints a summary about a given student
    func summary() -> String {
        return "\(name) is \(age) years old, their student ID is \(ID) and their NSN is \(NSN), their email is \(email)."
    }
}


// This struct is for Task A: race garage
// Struct contains info about given car models
struct Car {
    let brand: String
    let model: String
    let year: Int

    // This func prints a summary about a given car
    func carSummary() -> String {
        return "The car is a \(brand) \(model) from \(year)"
    }    
}

// Part of Task B: vvvvvvvvvvv

// Creates struct that holds bank account info
struct BankAccounts {
    let owner: String
    var balance: Double

    // prints a description of a given bank account
    func description() -> String {
        return "\(owner) has an account balance of \(balance)"
    }
}

// struct created for Task C: Rectangle:
// struct stores width and height of rectangles and the method obtains the area
struct Rectangle {
    let width: Double
    let height: Double

    func area() -> Double {
        return height * width
    }
}
@main
struct SwiftPlayground {
    static func main() {
        
        // Creates a student for myself containing my info
        let dylan = Student(ID: 22774, name: "Dylan", NSN: 0143802249, email: "dylan.jenkins@student.onslow.school.nz", age: 17)

        // Creates a list of students and their info, all of which are 100% real
        let students: [Student] = [
            Student(ID: 38465, name: "Bartholemew", NSN: 67, email: "bart.tholemew@student.onslow.school.nz", age: 97),
            Student(ID: 94769, name: "Bernard", NSN: 12, email: "ber.nard@student.onslow.school.nz", age: 14),
            Student(ID: 18563, name: "Robert", NSN: 54, email: "rob.ert@student.onslow.school.nz", age: 76),
            Student(ID: 65346, name: "Thanos", NSN: 75, email: "iam.inevitable@student.onslow.school.nz", age: 100),
            Student(ID: 19642, name: "Alex", NSN: 24, email: "alex.jenkins@student.onslow.school.nz", age: 15)
        ]
        
        // creates a new list that gets the ages of each student in 10 years using .map
        // all the names and new ages are then printed
        let agesInADecade = students.map {
            "\($0.name) will be \($0.age + 10) in a decade"
        }
        print(agesInADecade)        

        // prints a summary for myself
        print(dylan.summary())

// Task A: race garage:

        // a list is created containing different cars
        let cars: [Car] = [
            Car(brand: "Toyota", model: "Corolla", year: 2019),
            Car(brand: "Toyota", model: "Rav 4", year: 2017)
        ]

        // the different cars are then printed using the car summary function
        print(cars[0].carSummary())
        print(cars[1].carSummary())


        // Task B: mini banking model
        // makes a list containg two bank accounts
        let accounts: [BankAccounts] = [
            BankAccounts(owner: "Dylan", balance: 67),
            BankAccounts(owner: "Alex", balance: 21)
        ]

        // prints descriptions of the two accounts in the array
        print(accounts[0].description())
        print(accounts[1].description())


        // Task C: Rectangles
        // adds two rectangles to the struct with different dimensions
        let Rectangles: [Rectangle] = [
            Rectangle(width: 6, height: 8),
            Rectangle(width: 8, height: 12)
        ]

        // prints the areas of both rectangles in the list
        print(Rectangles[0].area())
        print(Rectangles[1].area())

        // This conditional statement tells the user whicb rectangle is larger
        if Rectangles[0].area() < Rectangles[1].area() {
            print("The the larger rectangle is the second one with an area of \(Rectangles[1].area())")
        }
        else {
            print("The the larger rectangle is the first one with an area of \(Rectangles[0].area())")
        }
    }
}
