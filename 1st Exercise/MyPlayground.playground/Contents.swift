import Swift
func solve(list: [String])
{
    for i in 0..<list.count
    {
        let number = Int(list[i])
        if number == 7
        {
            break
        }
        switch number!{
        case 7:
            break
        case Int.min...3:
            print("Number is les than 3")
            fallthrough
        case Int.min...6:
            print("Number is les than 6")
            fallthrough
        case Int.min...10:
            print("Number is les than 10")
        default:
            print("Number is greater than 10")
        }
    }
}

let arrayList = readLine()?.split {$0 == " "}.map (String.init)

if let list = arrayList
{
    solve(list: list)
}

