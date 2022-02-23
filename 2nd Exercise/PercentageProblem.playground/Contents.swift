import UIKit

func solve(_ amount: [Double]) -> [Int]
{
    // Add all amount
    let total = amount.reduce(0, +)
    
    var percent = [Int]()
    //This array calculate diffrence of each stock (rounded - withoutRounded)
    //    var diff = [Double]()
    var val1 = (diff1: Double(Int.max), index: -1)
    var val2 = (diff2: Double(Int.min), index: -1)
    
    for (idx, i) in amount.enumerated() {
        
        let eachStockPercentageWithoutRound = ((i*100)/total)
        let eachStockPercentage = min(Double(100-amount.count+1),max(1,((i*100)/total).rounded()))
        let diff: Double = eachStockPercentage - eachStockPercentageWithoutRound
        
        if diff >= 0, val1.diff1 > diff {
            val1.diff1 = diff
            val1.index = idx
        } else if diff < 0, val2.diff2 < abs(diff) {
            val2.diff2 = abs(diff)
            val2.index = idx
        }
        
        percent.append(Int(eachStockPercentage))
    }
    
    // Add calculated RoundOff percentage of each stock
    let stockTotalPer = percent.reduce(0, +)
    
    guard stockTotalPer != 100 else {
        return percent
    }
    guard stockTotalPer < 100 else {
        percent[val1.index]-=1
        return percent
    }
    
    percent[val2.index]+=1
    return percent
    
    
}
let amounts: [[Double]] = [[50, 70, 120, 110],[99.2,0.4,0.4],[99.6,0.2,0.2],[99.6,0.1,0.1,0.1,0.1],[33,33,33],[61.25,38.75],[79.8,10.1,10.1],[79.2,10.4,10.4],[69.2,20.4,10.4],[0.9,0.8,98.5],[0,1,99]]

for amount in amounts {
    let percentage: [Int] = solve(amount)
    print("Each Stock percentage assigned: \(percentage)")
}

