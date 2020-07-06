
import UIKit

// July 3rd 
// Jerry_Ren

class FriendsTVSeries {
    
    fileprivate func hangOut(people: [MainCharactersName]) {
        var scene: String = ""
        for individual in people {
            scene.append("\(individual) and ")
        }
        let leng = scene.count
        scene = String(scene.prefix(leng - 4))
        scene.append("are hanging out")
        print(scene)
    }
    
    var episodeNumber: Int
    var seasonNumber: Int
    
    init(episodeNumber: Int, seasonNumber:Int) {
        self.episodeNumber = episodeNumber
        self.seasonNumber = seasonNumber
    }

    enum SignificantLocations {
        case CentralPerkCoffeHouse
        case MonicaAndRachelsApartment
        case ChandlerAndJoeysApartment
    }
}

struct FriendsMainCharacter {
    var name: MainCharactersName
    var age: Int
    var birthday: Date
    var personality: PersonalityType
    var currentSpouse: String?
    var datingHistory: [SupportingCharacter]
}

enum MainCharactersName {
    case Joey
    case Chandler
    case Phoebe
    case Rachel
    case Ross
    case Monica
}

struct SupportingCharacter {
    var characterName: String
    var personality: PersonalityType
    init(characterName: String, personality: PersonalityType) {
        self.characterName = characterName
        self.personality = personality
    }
}

enum PersonalityType {
    case INFP
    case INTP
    case INFJ
    case INTJ
    case ENTJ
    case ENFJ
    case ENFP
    case ENTP
    case ESTP
    case ESFP
    case ESFJ
    case EFTJ
    case ISTJ
    case ISFJ
    case ISFP
    case ISTP
}
     
let friendz = FriendsTVSeries.init(episodeNumber: 11, seasonNumber: 6)
friendz.hangOut(people: [.Chandler, .Phoebe, .Joey])
