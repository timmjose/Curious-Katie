import UIKit
import Foundation

class Participant : Hashable {
    
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    var uid: Int
    var name: String
    var age: Int
    var interest: Set<Interest>
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
    
    init(uid: Int, name: String, age: Int, interest: Set<Interest>) {
        self.uid = uid
        self.name = name
        self.age = age
        self.interest = interest
    }
}

class Interest : Hashable {
    
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    var uid: Int
    var name: String
    var description: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
    init(uid: Int, name: String, description: String) {
        self.uid = uid
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
    case cooking = "Cooking"
    case sports = "Sports"
    case playingGames = "Games"
}

var participant1 = Participant(uid: 1, name: "Joey", age: 26, interest:
    [Interest(uid: 1, name: InterestName .acting.rawValue, description: "I love acting, I'm good looking and I'm a natural!"),
     Interest(uid: 2, name: InterestName .eatingPizza.rawValue, description: "I can eat a 3 whole pizzas in one sitting!"),
     Interest(uid: 9, name: InterestName .sports.rawValue, description: "I'm a natural athelete!"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: "I can beat anyone in any game!")])

var participant2 = Participant(uid: 2, name: "Chandler", age: 27, interest:
    [Interest(uid: 4, name: InterestName .dancing.rawValue, description: "When I feel it, I get movin'!"),
     Interest(uid: 2, name: InterestName .eatingPizza.rawValue, description: "I can eat a 3 whole pizzas in one sitting!"),
     Interest(uid: 7, name: InterestName .jokingAround.rawValue, description: "Could I be more specific!?"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: "I bet I can beat that Joey!")])

var participant3 = Participant(uid: 3, name: "Monica", age: 26, interest:
    [Interest(uid: 5, name: InterestName .singing.rawValue, description: "Shine the spotlight!"),
     Interest(uid: 8, name: InterestName .cooking.rawValue, description: "I'm a professional chef! I cook for a living"),
     Interest(uid: 3, name: InterestName .shopping.rawValue, description: ""),
     Interest(uid: 9, name: InterestName .sports.rawValue, description: "I'm competitive so I love winning! Sports is definitely my thing!")])

var participant4 = Participant(uid: 4, name: "Rachel", age: 25, interest:
    [Interest(uid: 6, name: InterestName .drinkingCoffee.rawValue, description: "Coffee gets me up and running!"),
     Interest(uid: 4, name: InterestName .dancing.rawValue, description: ""),
     Interest(uid: 3, name: InterestName .shopping.rawValue, description: "I LOVE LOVE LOVE SHOPPING!")])

var participant5 = Participant(uid: 5, name: "Phoebe", age: 27, interest:
    [Interest(uid: 6, name: InterestName .drinkingCoffee.rawValue, description: "Soy latte a day keeps me going!"),
     Interest(uid: 5, name: InterestName .singing.rawValue, description: "At one point in my life I used to play guitar and sing at a coffee shop"),
     Interest(uid: 7, name: InterestName .jokingAround.rawValue, description: "")])

var participant6 = Participant(uid: 6, name: "Ross", age: 28, interest:
    [Interest(uid: 6, name: InterestName .dancing.rawValue, description: ""),
     Interest(uid: 5, name: InterestName .eatingPizza.rawValue, description: ""),
     Interest(uid: 7, name: InterestName .jokingAround.rawValue, description: "I like to think that I'm pretty funny"),
     Interest (uid: 9, name: InterestName .sports.rawValue, description: "I always like to win, and sports shows that")])

var participant7 = Participant(uid: 7, name: "Mike", age: 27, interest:
    [Interest(uid: 4, name: InterestName .dancing.rawValue, description: "Bring me to the disco and I'll show you what I mean"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: ""),
     Interest(uid: 1, name: InterestName .acting.rawValue, description: "I've played Ant-man in the Marvel movies"),
     Interest (uid: 2, name: InterestName .eatingPizza.rawValue, description: "")])

var participant8 = Participant(uid: 8, name: "Ted", age: 26, interest:
    [Interest(uid: 8, name: InterestName .cooking.rawValue, description: "I like to impress the ladies with my cooking skills"),
     Interest(uid: 7, name: InterestName .jokingAround.rawValue, description: "I'm actually the funniest here, or am I..?"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: "I'm a natural!")])

var participant9 = Participant(uid: 9, name: "Barney", age: 27, interest:
    [Interest(uid: 5, name: InterestName .singing.rawValue, description: "The mic and spotlight are my best friends"),
     Interest(uid: 1, name: InterestName .acting.rawValue, description: "I'm in quite a couple of shows you may know of"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: "I'm a natural! I'm better than Ted!")])

var participant10 = Participant(uid: 10, name: "Robin", age: 27, interest:
    [Interest(uid: 8, name: InterestName .cooking.rawValue, description: ""),
     Interest(uid: 1, name: InterestName .acting.rawValue, description: "I am an agent of Shield in the Marvel movies"),
     Interest(uid: 9, name: InterestName .sports.rawValue, description: "I'm physically fit and I love sports")])

var participant11 = Participant(uid: 11, name: "Lily", age: 25, interest:
    [Interest(uid: 8, name: InterestName .cooking.rawValue, description: "I'm quite the wizard in the kitchen"),
     Interest(uid: 7, name: InterestName .jokingAround.rawValue, description: "I like making fun of my friends"),
     Interest(uid: 6, name: InterestName .drinkingCoffee.rawValue, description: "")])

var participant12 = Participant(uid: 12, name: "Marshall", age: 26, interest:
    [Interest(uid: 9, name: InterestName .sports.rawValue, description: "I've always been the tallest dude and it's been such an advantage"),
     Interest(uid: 10, name: InterestName .playingGames.rawValue, description: "I've created my own boardgames"),
     Interest(uid: 5, name: InterestName .singing.rawValue, description: "")])


var participantsAvailable: [Participant] = []

participantsAvailable.append(participant1)
participantsAvailable.append(participant2)
participantsAvailable.append(participant3)
participantsAvailable.append(participant4)
participantsAvailable.append(participant5)
participantsAvailable.append(participant6)
participantsAvailable.append(participant7)
participantsAvailable.append(participant8)
participantsAvailable.append(participant9)
participantsAvailable.append(participant10)
participantsAvailable.append(participant11)
participantsAvailable.append(participant12)

var participantsSelected = [Participant]()

participantsAvailable.shuffle()

var numberOfParticipantsSelected = Int.random(in: 2...participantsAvailable.count)

if numberOfParticipantsSelected % 2 != 0 {
    numberOfParticipantsSelected += 1
}

print (numberOfParticipantsSelected)

for i in 1...numberOfParticipantsSelected {
    
    participantsSelected.append(participantsAvailable[i])
}

print (participantsSelected.count)

//Pairing

for i in 0...participantsSelected.count {
    if participantsSelected[i].interest.intersection(participantsSelected[i+1].interest) == [] {
        participantsSelected.remove(at: i)
        participantsSelected.remove(at: i+1)
        print (participantsSelected.count)
    }
}

