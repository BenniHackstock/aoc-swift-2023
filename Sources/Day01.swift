struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map{value in
            String(value)
        }
    }
    
    func part1() -> Any {
        // Calculate the sum of the first set of input data
        let numbersOnly = entities.map{ line in
            return getNumbersInLine1(line)
        }
        
        let result =  numbersOnly.reduce(0, +)
        return result
    }
    
    func part2() -> Any {
        let numbersOnly = entities.map{line in
            return getNumbersInLine2(line)
        }
        
        let result =  numbersOnly.reduce(0, +)
        return result
    }
    
    fileprivate func getNumbersInLine1(_ line: String) -> Int {
        let first = line.first{$0.isNumber}!
        let last = line.last { char in
            char.isNumber
        }!
        let combined = "\(first)\(last)"
        return Int(combined)!
    }
    
    fileprivate func getNumbersInLine2(_ line: String) -> Int {
        var newLine = line
        newLine = newLine.replacingOccurrences(of: "zero", with: "zero0zero")
        newLine = newLine.replacingOccurrences(of: "one", with: "one1one")
        newLine = newLine.replacingOccurrences(of: "two", with: "two2two")
        newLine = newLine.replacingOccurrences(of: "three", with: "three3three")
        newLine = newLine.replacingOccurrences(of: "four", with: "four4four")
        newLine = newLine.replacingOccurrences(of: "five", with: "five5five")
        newLine = newLine.replacingOccurrences(of: "six", with: "six6six")
        newLine = newLine.replacingOccurrences(of: "seven", with: "seven7seven")
        newLine = newLine.replacingOccurrences(of: "eight", with: "eight8eight")
        newLine = newLine.replacingOccurrences(of: "nine", with: "nine9nine")
        
        let result = getNumbersInLine1(newLine)
        print("mapped \(line) to \(newLine) to \(result)")
        return result
    }
}
