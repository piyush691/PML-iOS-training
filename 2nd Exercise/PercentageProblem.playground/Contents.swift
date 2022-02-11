import UIKit

func solve(_ amount: [Double]) -> [Int]
{
    // Add all amount
    let total = amount.reduce(0, +)
    
    var percent = [Int]()
    //This array calculate diffrence of each stock (rounded - withoutRounded)
    var diff = [Double]()
    
    for i in amount
    {
        let eachStockPercentageWithoutRound = ((i*100)/total)
        
        let eachStockPercentage = min(Double(100-amount.count+1),max(1,((i*100)/total).rounded()))
        diff.append(eachStockPercentage - eachStockPercentageWithoutRound)
        percent.append(Int(eachStockPercentage))
    }
    // Add calculated RoundOff percentage of each stock
    let stockTotalPer = percent.reduce(0, +)
    
    if(stockTotalPer == 100)
    {
        return percent
    }
    else if(stockTotalPer > 100)
    {
        var idx = -1
        var value: Double = Double(Int.max)
        
        for (index, element) in diff.enumerated()
        {
            if element > 0
            {
                if value > element
                {
                    value = element
                    idx = index
                }
            }
        }
        
        percent[idx]-=1
        return percent
    }
    else {
        var idx = -1
        var value: Double = Double(Int.min)
        
        for (index, element) in diff.enumerated()
        {
            if element < 0
            {
                if value < abs(element)
                {
                    value = abs(element)
                    idx = index
                }
            }
        }
        
        percent[idx]+=1
        return percent
    }
    
}
let amounts: [[Double]] = [[50, 70, 120, 110],[99.2,0.4,0.4],[99.6,0.2,0.2],[99.6,0.1,0.1,0.1,0.1],[33,33,33],[61.25,38.75],[79.8,10.1,10.1],[79.2,10.4,10.4]]

for amount in amounts {
    let percentage: [Int] = solve(amount)
    print("Each Stock percentage assigned: \(percentage)")
}

