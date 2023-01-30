import Foundation
struct Response : Codable {
	let id : Int?
	let date : String?
	let time : String?
	let timestamp : Int?
	let timezone : String?
	let stage : String?
	let week : String?
	let status : Status?
	let league : League?
	let country : Country?
	let teams : Teams?
	let scores : Scores?

}
