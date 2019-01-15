//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        
        // check last element
        // check if element is nil
        if args.count == 3 {
            let left = Int(args[0])
            let operation = args[1]
            let right = Int(args[2])
            
            // switch case for +, -, /, %, *
            switch operation {
            case "+":
                return left! + right!
            case "-":
                return left! - right!
            case "/":
                return left! / right!
            case "*":
                return left! * right!
            case "%":
                return left! % right!
            default:
                return 0
            }
        } else {
            let last = args.last
            
            if args.count == 1 {
                return 0
            } else {
                switch last {
                case "count":
                    return args.count - 1
                case "avg":
                    var sum = 0
                    for index in 0...args.count - 2 {
                        sum += Int(args[index])!
                    }
                    return sum / (args.count - 1)
                case "fact":
                    let fact = Int(args[0])!
                    if fact == 1 || fact == 0 {
                        return 1
                    }
                    var sum = fact
                    for index in stride(from: fact - 1, to: 1, by: -1) {
                        sum*=index
                    }
                    return sum
                default:
                    return 0
                }
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

