import Foundation

struct GameBase: Codable {
    let get: String?
    let parameters: String
    let errors: [String]?
    let results: Int?
    let response: [Response]?
}


struct Response: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let timezone: String?
    let stage: String?
    let week: String?
    let status: StatusGame?
    let league: League?
    let country: Country?
    let teams: Teams?
    let scores: Scores?
}

struct StatusGame: Codable {
    let long: String?
    let short: String?
    let timer: String?
}

struct League: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let season: String?
    let logo: String?
}

struct Country: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

struct Teams: Codable {
    let home: Home?
    let away: Away?
}

struct Home: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}

struct Away: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}

struct Scores: Codable {
    let home: HomeScore?
    let away: AwayScore?
}

struct HomeScore: Codable {
    let quarter_1: Int?
    let quarter_2: Int?
    let quarter_3: Int?
    let quarter_4: Int?
    let over_time: String?
    let total: Int?
}

struct AwayScore: Codable {
    let quarter_1: Int?
    let quarter_2: Int?
    let quarter_3: Int?
    let quarter_4: Int?
    let over_time: String?
    let total: Int?
}
