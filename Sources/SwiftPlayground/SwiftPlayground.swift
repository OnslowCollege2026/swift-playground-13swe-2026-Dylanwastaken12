// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {

        // compactMap test:
        let rawScores = ["42", "x", "100", "", "65"]
        let scores = rawScores.compactMap({Int($0)})
        print(scores)

        // allSatisfy test
        let ages = [13, 14, 15, 16]
        let allTeenagers = ages.allSatisfy { $0 >= 13 && $0 <= 19}
        print(allTeenagers)

        // first(where:) and firstIndex(where:) test:
        let names = ["Aroha", "Moana", "Hana", "Pita"]
        let firstLongName = names.first { $0.count >= 5 }
        let firstLongIndex = names.firstIndex { $0.count >= 5 }
        print(firstLongName ?? "none")
        print(firstLongIndex ?? -1)


        // Task A: hidden numbers:

        // uses compactMap to get rid of all the strings in the collection
        let mixed = ["cat" , "7" , "owl", "15", "dog", "7"]
        let numbers = mixed.compactMap({ Int($0) })
        print(numbers)
        // uses allSatisfy to see if the new array contains only integers
        // in this case there are number strings so it returns false
        let allNumberStrings = mixed.allSatisfy { Int($0) != nil }
        print(allNumberStrings)

        // Task B: midnight filter:


        let sightings = [
            (name: "moth", score: 3),
            (name: "wolf", score: 9),
            (name: "raven", score: 4),
            (name: "mist", score: 7),
            (name: "wisp", score: 2)
        ]
        // filters the sightings so that any names beggining with anything
        // other than m or w is deleted
        let filteredSightings = sightings.filter {
            $0.0.first == "m" || $0.0.first == "w"
        }

        // the scores from the filtered collection are extracted then added together using map, total score is then printed.
        let sightingScores = filteredSightings.map {
            $0.score
        }
        let totalScores = sightingScores.reduce(0) {
            $0 + $1
        }
        print(totalScores)

        // uses .max and .min to get the hghest and lowest score, these are then printed
        if let highScore = sightingScores.max { $0 < $1 }, let lowScore =               sightingScores.min { $0 < $1 } {
            print(highScore)
            print(lowScore)
        }

        // Task C: safe input check:

        func accepts(_ input: String, isValid: (String) -> Bool) -> Bool {
            return isValid(input)
        }   
        let sample = "moonlight"

    }

}



