import Foundation

struct gamesBase : Codable {
	let get : String?
	let parameters : Parameters?
	let errors : [String]?
	let results : Int?
	let response : [Response]?
}

struct Away : Codable {
    let quarter_1 : String?
    let quarter_2 : String?
    let quarter_3 : String?
    let quarter_4 : String?
    let overtime : String?
    let total : String?
}

struct Country : Codable {
    let name : String?
    let code : String?
    let flag : String?
}


struct Date : Codable {
    let timezone : String?
    let date : String?
    let time : String?
    let timestamp : Int?
}

struct Game : Codable {
    let id : Int?
    let stage : String?
    let week : String?
    let date : Date?
    let venue : Venue?
    let status : Status?
}

struct Home : Codable {
    let quarter_1 : String?
    let quarter_2 : String?
    let quarter_3 : String?
    let quarter_4 : String?
    let overtime : String?
    let total : String?
}

struct League : Codable {
    let id : Int?
    let name : String?
    let season : String?
    let logo : String?
    let country : Country?
    
}

struct Parameters : Codable {
    let date : String?
}

struct Response : Codable {
    let game : Game?
    let league : League?
    let teams : Teams?
    let scores : Scores?
}

struct Scores : Codable {
    let home : Home?
    let away : Away?
}

struct Teams : Codable {
    let home : Home?
    let away : Away?
}

struct Venue : Codable {
    let name : String?
    let city : String?
}

struct Status : Codable {
    let short : String?
    let long : String?
    let timer : String?
}


