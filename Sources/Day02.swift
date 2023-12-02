struct Day02: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [Game] {
        data.split(separator: "\n").map{value in
            Game(line: String(value))
        }
    }
    
    func part1() -> Any {
        let validGames = entities.filter{ game in
            let containsInvalidRounds = game.rounds.contains{round in
                round.red > 12 || round.green > 13 || round.blue > 14
            }
            return !containsInvalidRounds //keep only valid ones
        }
        return validGames.map{$0.id}.reduce(0, +)
    }
    
    
    func part2() -> Any {
        let result = entities
            .map{ game in
                //find min number of pebbels necessary
                var red = 0
                var green = 0
                var blue = 0
                for round in game.rounds {
                    red = max(red, round.red)
                    green = max(green, round.green)
                    blue = max(blue, round.blue)
                }
                return (red, blue,green)
            }
            .map{
                //get "power" of pebble set
                $0*$1*$2
            }
            .reduce(0, +)
        
        return result
    }
    
    struct Game{
        let id: Int
        let rounds: [Round]
        
        init(line: String){
            self.id = Int(line.split(separator: " ")[1].dropLast(1))!
            self.rounds = line.split(separator:";").map {roundLine in
                Round(line: roundLine)
            }
        }
        
        init(id: Int, red: Int, blue: Int, green: Int){
            self.id = id
            self.rounds = [Round(red: red, blue: green, green: blue )]
        }
    }
    
    struct Round {
        var red: Int
        var green: Int
        var blue: Int
        
        init( red: Int, blue: Int, green: Int){
            self.red = red
            self.green = green
            self.blue = blue
        }
        
        init(line: Substring){
            self.red = line.contains("red") ? {
                let split1 = line.split(separator: " red")[0]
                let split2 = split1.split(separator: " ").last!
                return Int(split2)!
            }() : 0
            
            self.blue = line.contains("blue") ? {
                let split1 = line.split(separator: " blue")[0]
                let split2 = split1.split(separator: " ").last!
                return Int(split2)!
            }() : 0
            
            self.green = line.contains("green") ? {
                let split1 = line.split(separator: " green")[0]
                let split2 = split1.split(separator: " ").last!
                return Int(split2)!
            }() : 0
        }
    }
    
}
