// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        struct Student {
            let ID: Int
            var name: String
            let NSN: Int
            var email: String
            var age: Int

            func summary() -> String {
            return "\(name) is \(age) years old, their student ID is \(ID) and their NSN is \(NSN), their email is \(email)."
        }
        }
        
        let dylan = Student(ID: 22774, name: "Dylan", NSN: 0143802249, email: "dylan.jenkins@student.onslow.school.nz", age: 17)

        let students: [Student] = [
            Student(ID: 38465, name: "Bartholemew", NSN: 67, email: "bart.tholemew@student.onslow.school.nz", age: 97),
            Student(ID: 94769, name: "Bernard", NSN: 12, email: "ber.nard@student.onslow.school.nz", age: 14),
            Student(ID: 18563, name: "Robert", NSN: 54, email: "rob.ert@student.onslow.school.nz", age: 76),
            Student(ID: 65346, name: "Thanos", NSN: 75, email: "iam.inevitable@student.onslow.school.nz", age: 100),
            Student(ID: 19642, name: "Alex", NSN: 24, email: "alex.jenkins@student.onslow.school.nz", age: 15)
        ]
        
        let agesInADecade = students.map {
            "\($0.name) will be \($0.age + 10) in a decade"
        }
        print(agesInADecade)

        print("Dylan is \(dylan.age) years old")

        

        print(dylan.summary())
    }
}
