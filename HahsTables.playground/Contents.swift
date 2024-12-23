import UIKit

var greeting = "Hello, playground"

var voted = [String: Bool]()
voted.updateValue(true, forKey: "sarvar")
voted.updateValue(true, forKey: "samandar")
voted.updateValue(true, forKey: "mustafo")

func checkVoter(name: String) {
   let isVoted =  voted.contains { key, value in
       key.lowercased() == name.lowercased()
    }
    
    if isVoted {
        print("Kick out")
    } else {
        voted[name] = true
        print("You're welcome to vote")
    }
}

checkVoter(name: "behruz")

