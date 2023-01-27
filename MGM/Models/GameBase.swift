import Foundation

// MARK: - GameBase
import Foundation

// MARK: - Welcome6
struct GameBase: Codable {
    let welcome6Get: String
    let parameters: Parameters
    let errors : [String]?
    let results: Int
    let response: [Response]
}

// MARK: - Parameters
struct Parameters: Codable {
    let date: String
}

// MARK: - Response
struct Response: Codable {
    let id : Int?
        let date : String?
        let time : String?
        let timestamp : Int?
        let timezone : String?
        let stage : String?
        let week : String?
        let status : Status?
        let league : League
        let country : Country
        let teams : Teams
        let scores : Scores
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
    let code: String?
    let flag: String?
}

// MARK: - League
struct League: Codable {
    let id: Int
    let name: String
    let type: String?
    let season: String?
    let logo: String
}


// MARK: - Scores
struct Scores: Codable {
    let home, away: ScoresAway
}

// MARK: - ScoresAway
struct ScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime, total: Int?
}

// MARK: - Status
struct Status: Codable {
    let long: String?
    let short: String?
    let timer: String?
}





// MARK: - Teams
struct Teams: Codable {
    let home, away: TeamsAway
}

// MARK: - TeamsAway
struct TeamsAway: Codable {
    let id: Int
    let name: String
    let logo: String
}


