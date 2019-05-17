/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Restaurants : Codable {
	let _id : String?
	let slug : String?
	let eid : String?
	let title : String?
	let description : String?
	let category_eid : String?
	let __v : Int?
	let photo : String?
	let _active : Bool?
	let updated_at : String?
	let created_at : String?
	let addresses : [Addresses]?
	let contactInfo : ContactInfo?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case slug = "slug"
		case eid = "eid"
		case title = "title"
		case description = "description"
		case category_eid = "category_eid"
		case __v = "__v"
		case photo = "photo"
		case _active = "_active"
		case updated_at = "updated_at"
		case created_at = "created_at"
		case addresses = "addresses"
		case contactInfo = "contactInfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		eid = try values.decodeIfPresent(String.self, forKey: .eid)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		category_eid = try values.decodeIfPresent(String.self, forKey: .category_eid)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		photo = try values.decodeIfPresent(String.self, forKey: .photo)
		_active = try values.decodeIfPresent(Bool.self, forKey: ._active)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		addresses = try values.decodeIfPresent([Addresses].self, forKey: .addresses)
		contactInfo = try values.decodeIfPresent(ContactInfo.self, forKey: .contactInfo)
	}

}
