import Foundation

struct EventsBase : Codable {
    let get : String?
    let parameters : EventsParameters?
    let errors : [String]?
    let results : Int?
    let response : [EventsResponse]?
}

struct EventsParameters : Codable {
    let id : String?
}

struct EventsPlayer : Codable {
    let id : Int?
    let name : String?
    let image : String?
}

struct EventsResponse : Codable {
    let quarter : String?
    let minute : String?
    let team : EventsTeam?
    let player : EventsPlayer?
    let type : String?
    let comment : String?
    let score : EventsScore?
}

struct EventsScore : Codable {
    let home : Int?
    let away : Int?
}

struct EventsTeam : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}
