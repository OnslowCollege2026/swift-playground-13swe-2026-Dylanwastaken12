// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let numbers = [1, 2, 3, 4, 5]

        // cubes numbers in the array
        let cubedNumbers = numbers.map { number in
            return number * number * number
        }
        print(cubedNumbers)

        // filters out the eve numbers in the new array of cubed numbers
        let evenNumbers = cubedNumbers.filter { number in
            return number % 2 == 0
        }
        print(evenNumbers)

        // adds the even cubed numbers into one number 
        let total = evenNumbers.reduce(0) { result, number in
            return result + number
        }

        // prints combined value of even cubed numbers
        print(total)
    }
}
