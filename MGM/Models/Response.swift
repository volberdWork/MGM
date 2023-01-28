/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case time = "time"
		case timestamp = "timestamp"
		case timezone = "timezone"
		case stage = "stage"
		case week = "week"
		case status = "status"
		case league = "league"
		case country = "country"
		case teams = "teams"
		case scores = "scores"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		stage = try values.decodeIfPresent(String.self, forKey: .stage)
		week = try values.decodeIfPresent(String.self, forKey: .week)
		status = try values.decodeIfPresent(Status.self, forKey: .status)
		league = try values.decodeIfPresent(League.self, forKey: .league)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		teams = try values.decodeIfPresent(Teams.self, forKey: .teams)
		scores = try values.decodeIfPresent(Scores.self, forKey: .scores)
	}

}