// The Swift Programming Language
// https://docs.swift.org/swift-book



func totalCost(prices: [Double]) -> Double {
    var totalPrice: Double = 0

    for price in prices {
        totalPrice += price
    }
    return totalPrice
}

func isOverBudget(total: Double, budget: Double) -> Bool {
    if total > budget {
        return true    
    } else {
        return false
    }
}

func averageCost(prices: Double) -> Double {
    let averageCost = prices / 5
    return averageCost
}

let weeklyBudget: Double = 35

@main
struct SwiftPlayground {
    static func main() {
        let lunches: [Double] = [6.50, 8.00, 5.75, 9.20, 7.10]

        for (index, price) in lunches.enumerated() {
            print("Day \(index + 1): $\(price)")
            if price > 9 {
                print("Warning: High spending day detected")
            }
        }

        let weeklyTotalCost = totalCost(prices: lunches)
        if isOverBudget(total: weeklyTotalCost, budget: 35) {
            print("Warning: you overspent this week")
        } else {
            print("You stayed inside the budget")
        }
        let snackBudget: Double = 10
        let snackPrice: Double = 2.5
        var snackTotal: Double = 0

        while snackTotal < snackBudget {
            snackTotal += snackPrice
            print("Your snack total is now: \(snackTotal)")
        }
        print("Your total cost for the week was: \(weeklyTotalCost)")
        print("Your average cost for the week was: \(averageCost(prices: weeklyTotalCost))")
        print("Your total money spent this week was: \(snackTotal + weeklyTotalCost)")
        
        if isOverBudget(total: weeklyTotalCost, budget: 35) {
            print("Warning: you overspent this week")
        } else {
            print("You stayed inside the budget")
        }



    }
    
    




    
    }

    

