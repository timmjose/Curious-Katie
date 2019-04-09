import UIKit

//Classes

class Participant {
    var name: String
    var interest: [interest]
    
    init(name: String, interest: [interest]) {
        self.name = name
        self.interest = interest
    }
}

class interest {
    var name: String
    var description: String
    
    init (name: String, description: String) {
        self.name = name
        self.description = description
    }
}

enum InterestName: String {
    case acting = "Acting"
    case eatingPizza = "Eating Pizza"
    case shopping = "Shopping"
    case dancing = "Dancing"
    case singing = "Singing"
    case drinkingCoffee = "Drinking Coffee"
    case jokingAround = "Joking Around"
}

var listOfParticipantsAvailable = [Participant]()
var listOfParticipantsSelected = [Participant]()

//Joey
let participant1 = Participant(name: "Joey", interest:
    [interest(name: InterestName .acting.rawValue, description: "I love acting, it's amazing, and it's because I'm good looking"),
     interest(name: InterestName .drinkingCoffee.rawValue, description: "Coffee wakes me up real nice"),
     interest(name: InterestName .eatingPizza.rawValue, description: "I love PIZZA!!")])

listOfParticipantsAvailable.append(participant1)

//Chandler
let participant2 = Participant(name: "Chandler", interest:
    [interest(name: InterestName .jokingAround.rawValue, description: "I'm pretty funny"),
     interest(name: InterestName .eatingPizza.rawValue, description: "I love PIZZA!!")])

listOfParticipantsAvailable.append(participant2)

//Algorithm

//let numberOfParticipants = Int.random(in: 2...12)

//For testing purposes xxxxxxxxxxxx
listOfParticipantsSelected.append(participant1)
listOfParticipantsSelected.append(participant2)

print ("Welcome everybody, my name is Katie, and we're going to play a game! Let's start off by introducing yourselves, where you are from, and your interests!\n\n")

for i in 0..<listOfParticipantsSelected.count {
    print ("Hi, my name is \(listOfParticipantsSelected[i].name), and these are my interests:")
    
    for interestGiven in 0..<listOfParticipantsSelected[i].interest.count {
        print ("\(listOfParticipantsSelected[i].interest[interestGiven].name), \(listOfParticipantsSelected[i].interest[interestGiven].description)")
    }
}
