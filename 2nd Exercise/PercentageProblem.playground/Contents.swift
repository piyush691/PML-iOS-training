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
        let eachStockPercentage = ((i*100)/total).rounded()
        diff.append(eachStockPercentage - eachStockPercentageWithoutRound)
        percent.append(Int(eachStockPercentage))
    }
    //    print(percent)
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
let amount: [Double] = [50, 70, 120, 110]

let percentage: [Int] = solve(amount)
print("Each Stock percentage assigned: \(percentage)")
