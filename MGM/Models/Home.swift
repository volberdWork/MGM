/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Home : Codable {
	let quarter_1 : Int?
	let quarter_2 : Int?
	let quarter_3 : Int?
	let quarter_4 : Int?
	let over_time : String?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case quarter_1 = "quarter_1"
		case quarter_2 = "quarter_2"
		case quarter_3 = "quarter_3"
		case quarter_4 = "quarter_4"
		case over_time = "over_time"
		case total = "total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quarter_1 = try values.decodeIfPresent(Int.self, forKey: .quarter_1)
		quarter_2 = try values.decodeIfPresent(Int.self, forKey: .quarter_2)
		quarter_3 = try values.decodeIfPresent(Int.self, forKey: .quarter_3)
		quarter_4 = try values.decodeIfPresent(Int.self, forKey: .quarter_4)
		over_time = try values.decodeIfPresent(String.self, forKey: .over_time)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}

}