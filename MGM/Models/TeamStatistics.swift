import Foundation

struct TeamStatistics : Codable {
    let get : String?
    let parameters : TSParameters?
    let errors : [String]?
    let results : Int?
    let response : [TSResponse]?
}

struct TSFirstDowns : Codable {
    let total : Int?
    let passing : Int?
    let rushing : Int?
    let from_penalties : Int?
    let third_down_efficiency : String?
    let fourth_down_efficiency : String?
}

struct TSFumblesRecovered : Codable {
    let total : Int?
}

struct TSIntTouchdowns : Codable {
    let total : Int?
}

struct TSInterceptions : Codable {
    let total : Int?
}

struct TSParameters : Codable {
    let id : String?
}

struct TSPassing : Codable {
    let total : Int?
    let comp_att : String?
    let yards_per_pass : String?
    let interceptions_thrown : Int?
    let sacks_yards_lost : String?
}

struct TSPenalties : Codable {
    let total : String?
}

struct TSPlays : Codable {
    let total : Int?
}

struct TSPointsAgainst : Codable {
    let total : Int?
}

struct TSPosession : Codable {
    let total : String?
}

struct TSRed_zone : Codable {
    let made_att : String?
}

struct TSResponse : Codable {
    let team : TSTeam?
    let statistics : TSStatistics?
}

struct TSRushings : Codable {
    let total : Int?
    let attempts : Int?
    let yards_per_rush : String?
}

struct TSSacks : Codable {
    let total : Int?
}

struct TSSafeties : Codable {
    let total : Int?
}

struct TSStatistics : Codable {
    let first_downs : TSFirstDowns?
    let plays : TSPlays?
    let yards : TSYards?
    let passing : TSPassing?
    let rushings : TSRushings?
    let red_zone : TSRed_zone?
    let penalties : TSPenalties?
    let turnovers : TSTurnovers?
    let posession : TSPosession?
    let interceptions : TSInterceptions?
    let fumbles_recovered : TSFumblesRecovered?
    let sacks : TSSacks?
    let safeties : TSSafeties?
    let int_touchdowns : TSIntTouchdowns?
    let points_against : TSPointsAgainst?
}

struct TSTeam : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}

struct TSTurnovers : Codable {
    let total : Int?
    let lost_fumbles : Int?
    let interceptions : Int?
}

struct TSYards : Codable {
    let total : Int?
    let yards_per_play : String?
    let total_drives : String?
}

