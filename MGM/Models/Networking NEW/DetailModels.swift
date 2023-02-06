import Foundation

struct TeamInfo : Codable {
    let get : String?
    let parameters : StatParameters?
    let errors : [String]?
    let results : Int?
    let paging : StatPaging?
    let response : [StatResponse]?
}

struct StatPaging : Codable {
    let current : Int?
    let total : Int?
}

struct StatParameters : Codable {
    let id : String?
}

struct StatResponse : Codable {
    let team : StatTeam?
    let venue : StatVenue?
}

struct StatTeam : Codable {
    let id : Int?
    let name : String?
    let code : String?
    let country : String?
    let founded : Int?
    let national : Bool?
    let logo : String?
}

struct StatVenue : Codable {
    let id : Int?
    let name : String?
    let address : String?
    let city : String?
    let capacity : Int?
    let surface : String?
    let image : String?
}
