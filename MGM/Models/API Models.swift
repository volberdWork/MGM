// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome1 = try Welcome1(json)

import Foundation

// MARK: - Welcome1
struct GameBase: Decodable {
    let get: String?
    let parameters: Parameters?
    let errors: [String?]
    let results: Int?
    let response: [Response]?
}

// MARK: - Parameters
struct Parameters: Decodable {
    let date: String?
}

// MARK: - Response
struct Response: Decodable {
    let game: Game?
    let league: League?
    let teams: Teams?
    let scores: Scores?
}

// MARK: - Game
struct Game: Decodable {
    let id: Int?
    let stage, week: String?
    let date: DateClass?
    let venue: Venue?
    let status: Status?
}

// MARK: - DateClass
struct DateClass: Decodable {
    let timezone, date, time: String?
    let timestamp: Int?
}

// MARK: - Status
struct Status: Decodable {
    let short, long: String?
    let timer: String?
}

// MARK: - Venue
struct Venue: Decodable {
    let name, city: String?
}

// MARK: - League
struct League: Decodable {
    let id: Int?
    let name, season: String?
    let logo: String?
    let country: Country?
}

// MARK: - Country
struct Country: Decodable {
    let name, code: String?
    let flag: String?
}

// MARK: - Scores
struct Scores: Decodable {
    let home, away: ScoresAway?
}

// MARK: - ScoresAway
struct ScoresAway: Decodable {
    let quarter1, quarter2, quarter3, quarter4: String?
    let overtime, total: String?
}

// MARK: - Teams
struct Teams: Decodable {
    let home, away: TeamsAway?
}

// MARK: - TeamsAway
struct TeamsAway: Decodable {
    let id: Int?
    let name: String?
    let logo: String?
}
