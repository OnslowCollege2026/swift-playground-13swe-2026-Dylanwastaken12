// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let mixed = ["cat" , "7" , "owl", "15", "dog", "7"]
        let numbers = mixed.compactMap({ Int($0) })
        print(numbers)
        let allNumberStrings = mixed.allSatisfy { Int($0) != nil }
        print(allNumberStrings)

        let sightings = [
            (name: "moth", score: 3),
            (name: "wolf", score: 9),
            (name: "raven", score: 4),
            (name: "mist", score: 7),
            (name: "wisp", score: 2)
        ]
        let filteredSightings = sightings.filter {
            $0.0.first == "m" || $0.0.first == "w"
        }
        let sightingScores = filteredSightings.map {
            $0.score
        }
        let totalScores = sightingScores.reduce(0) {
            $0 + $1
        }
        print(totalScores)

        if let highScore = sightingScores.max { $0 < $1 }, let lowScore =               sightingScores.max { $0 < $1 } {
            print(highScore)
            print(lowScore)
        }
        

    }

}



