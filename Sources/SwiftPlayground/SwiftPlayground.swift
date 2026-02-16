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



        // Map filter and reduce analysing student scores task:
        let scores = [45, 78, 89, 32, 50, 92, 67, 41, 99, 56]

        // uses map to add 5 to each score in the array then prints it
        let curvedScores = scores.map { $0 + 5 }
        print(curvedScores)

        // filters the new array of scores to get rid of any scores under 50
        // the filter list is then printed
        let filteredScores = curvedScores.filter { score in
            return score > 50}
        print(filteredScores)

        // uses the filtered array to combine scores using reduce then divide by
        // the number of scores to get an average which is then printed
        let totalScore = filteredScores.reduce(0) { result, score in
            result + score}
        let averageScore = totalScore / 7
        print(averageScore)
    }
}




