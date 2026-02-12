// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let mixed = ["cat" , "7" , "owl", "15", "dog", "7"]
        let numbers = mixed.compactMap({ Int in mixed })
        print(numbers)
    }
}



