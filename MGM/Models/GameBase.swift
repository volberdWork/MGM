import Foundation
struct GameBase : Codable {
	let get : String?
	let parameters : Parameters?
	let errors : [String]?
	let results : Int?
	let response : [Response]?
}
