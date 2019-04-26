import UIKit
import Foundation


class Participant {
    let name: String
    let age: Int
    var interests: Set<Interest>
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
        self.interests = Set<Interest>()
    }
}

class Interest {
    let uid: String
    let name: InterestName
    let description: String
    
    init (uid: String, name: InterestName, description: String? = nil) {
        self.uid = uid
        self.name = name
        self.description = description ?? name.rawValue
    }
}

extension Interest: Hashable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
}

enum InterestName: String {
    case acting         = "Acting"
    case eatingPizza    = "Eating Pizza"
    case shopping       = "Shopping"
    case dancing        = "Dancing"
    case singing        = "Singing"
    case drinkingCoffee = "Drinking Coffee"
    case comedy         = "Comedy"
    case cooking        = "Cooking"
    case football       = "Football"
    case playingGames   = "Games"
}


// 10 Interests xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

var acting = Interest(uid: NSUUID().uuidString, name: InterestName .acting)

var shopping = Interest(uid: NSUUID().uuidString, name: InterestName .shopping)

var cooking = Interest(uid: NSUUID().uuidString, name: InterestName .cooking)

var eatingPizza = Interest(uid: NSUUID().uuidString, name: InterestName .eatingPizza)

var dancing = Interest(uid: NSUUID().uuidString, name: InterestName .dancing)

var singing = Interest(uid: NSUUID().uuidString, name: InterestName .singing)

var drinkingCoffee = Interest(uid: NSUUID().uuidString, name: InterestName .drinkingCoffee)

var football = Interest(uid: NSUUID().uuidString, name: InterestName .football)

var comedy = Interest(uid: NSUUID().uuidString, name: InterestName .comedy)

var playingGames = Interest(uid: NSUUID().uuidString, name: InterestName .playingGames)

// 10 Participants xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

var participant1 = Participant(name: "Joey", age: 26)

participant1.interests.insert(acting)
participant1.interests.insert(eatingPizza)
participant1.interests.insert(dancing)
participant1.interests.insert(football)
participant1.interests.insert(comedy)

var participant2 = Participant(name: "Chandler", age: 27)

participant2.interests.insert(dancing)
participant2.interests.insert(eatingPizza)
participant2.interests.insert(comedy)
participant2.interests.insert(football)
participant2.interests.insert(playingGames)

var participant3 = Participant(name: "Monica", age: 26)

participant3.interests.insert(cooking)
participant3.interests.insert(drinkingCoffee)
participant3.interests.insert(dancing)
participant3.interests.insert(shopping)
participant3.interests.insert(acting)

var participant4 = Participant(name: "Rachel", age: 25)

participant4.interests.insert(cooking)
participant4.interests.insert(drinkingCoffee)
participant4.interests.insert(singing)
participant4.interests.insert(playingGames)
participant4.interests.insert(shopping)

var participant5 = Participant(name: "Phoebe", age: 27)

participant5.interests.insert(cooking)
participant5.interests.insert(drinkingCoffee)
participant5.interests.insert(singing)
participant5.interests.insert(comedy)
participant5.interests.insert(shopping)

var participant6 = Participant(name: "Mike", age: 27)

participant6.interests.insert(football)
participant6.interests.insert(eatingPizza)
participant6.interests.insert(dancing)
participant6.interests.insert(playingGames)
participant6.interests.insert(acting)

var participant7 = Participant(name: "Ted", age: 27)

participant7.interests.insert(comedy)
participant7.interests.insert(drinkingCoffee)
participant7.interests.insert(cooking)
participant7.interests.insert(playingGames)


var participant8 = Participant(name: "Barney", age: 26)

participant8.interests.insert(acting)
participant8.interests.insert(singing)
participant8.interests.insert(dancing)
participant8.interests.insert(playingGames)
participant8.interests.insert(acting)


var participant9 = Participant(name: "Robin", age: 26)

participant9.interests.insert(shopping)
participant9.interests.insert(drinkingCoffee)
participant9.interests.insert(football)
participant9.interests.insert(comedy)
participant9.interests.insert(acting)


var participant10 = Participant(name: "Marshall", age: 27)

participant10.interests.insert(football)
participant10.interests.insert(eatingPizza)
participant10.interests.insert(dancing)
participant10.interests.insert(playingGames)
participant10.interests.insert(drinkingCoffee)


var participant11 = Participant(name: "Lily", age: 26)

participant11.interests.insert(shopping)
participant11.interests.insert(acting)
participant11.interests.insert(dancing)
participant11.interests.insert(comedy)
participant11.interests.insert(acting)


var participant12 = Participant(name: "Celia", age: 27)

participant12.interests.insert(acting)
participant12.interests.insert(singing)
participant12.interests.insert(dancing)
participant12.interests.insert(shopping)
participant12.interests.insert(acting)

// Matching Algorithm xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

func matching(participants: [Participant]) -> [(Participant, Participant?)] {
    var participants = participants
    var matches: [(Participant, Participant?)] = []
    
    while !participants.isEmpty {
        let current = participants.popLast()!
        guard !participants.isEmpty else {
            matches.append((current, nil))
            break
        }
        
        let interests = current.interests
        
        var found: (index: Int, matchCount: Int) = (0, Int.max)
        for current in participants.enumerated() {
            let matchCount = current.element.interests.intersection(interests).count
            guard matchCount <= found.matchCount else { continue }
            found = (current.offset, matchCount)
        }
        
        let match = participants.remove(at: found.index)
        matches.append((current, match))
    }
    
    return matches
}

// Participants Algorithm and Print xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

var participants: [Participant] = [participant1, participant2, participant3, participant4, participant5, participant6, participant7, participant8, participant9, participant10, participant11, participant12]

participants.shuffle()

let maxParticipants = 12
var random = Int.random(in: 2 ... 12)

if random % 2 != 0 {
    random += 1
}

let randomParticipants = (maxParticipants - random)

for _ in 0..<randomParticipants {
    participants.remove(at: 0)
}

print ("Hi! My name is Katie, and we're going to play a party game! Let's get everybody to introduce themselves, their age, and their interests, then I'll pair you guys up with another person with little to no common interests!\n\n")

for member in 0..<participants.count {
    print ("Hi, my name is \(participants[member].name), my age is \(participants[member].age)")
    print ("These are my interests: \n")
}

print ("Terrific! Here are the pairings: ")

let matches = matching(participants: participants)

matches.forEach {
    guard let match = $0.1 else {
        print($0.0.name, "unmatched")
        return
    }
    print($0.0.name, match.name, $0.0.interests.intersection(match.interests).count)
}
