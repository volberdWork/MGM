import Foundation
struct PlayersStatisticBase : Codable {
    let get : String?
    let parameters : PSParameters?
    let errors : [String]?
    let results : Int?
    let response : [PSResponse]?
    
}

struct PSGroups : Codable {
    let name : String?
    let players : [PSPlayers]?
}

struct PSParameters : Codable {
    let id : String?
}

struct PSPlayer : Codable {
    let id : Int?
    let name : String?
    let image : String?
}

struct PSPlayers : Codable {
    let player : PSPlayer?
    let statistics : [PSStatistics]?
}


struct PSResponse : Codable {
    let team : PSTeam?
    let groups : [PSGroups]?
}

struct PSStatistics : Codable {
    let name : String?
    let value : String?
}

struct PSTeam : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}
