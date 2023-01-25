import Foundation

// MARK: - GameBase
struct GameBase: Codable {
    let gameBaseGet: String?
    let parameters: Parameters?
    let errors: [String?]
    let results: Int?
    let response: [Response]?

    enum CodingKeys: String, CodingKey {
        case gameBaseGet = "get"
        case parameters, errors, results, response
    }
}

// MARK: - Parameters
struct Parameters: Codable {
    let date: String?
}

// MARK: - Response
struct Response: Codable {
    let game: Game?
    let league: League?
    let teams: Teams?
    let scores: Scores?
}

// MARK: - Game
struct Game: Codable {
    let id: Int?
    let stage, week: String?
    let date: DateClass?
    let venue: Venue?
    let status: Status?
}

// MARK: - DateClass
struct DateClass: Codable {
    let timezone, date, time: String?
    let timestamp: Int?
}

// MARK: - Status
struct Status: Codable {
    let short, long: String?
    let timer: String?
}

// MARK: - Venue
struct Venue: Codable {
    let name, city: String?
}

// MARK: - League
struct League: Codable {
    let id: Int?
    let name, season: String?
    let logo: String?
    let country: Country?
}

// MARK: - Country
struct Country: Codable {
    let name, code: String?
    let flag: String?
}

// MARK: - Scores
struct Scores: Codable {
    let home, away: ScoresBase?
}

// MARK: - ScoresAway
struct ScoresBase: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overtime: String?
    let total: Int?

}

// MARK: - Teams
struct Teams: Codable {
    let home, away: TeamsAway?
}

// MARK: - TeamsAway
struct TeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
