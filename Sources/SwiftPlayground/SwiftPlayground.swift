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
    }
}
