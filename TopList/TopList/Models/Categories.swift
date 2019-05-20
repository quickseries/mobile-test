/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Categories : Codable, Equatable {
	let _id : String?
	let updated_at : String?
	let slug : String?
	let custom_module_eid : String?
	let eid : String?
	let title : String?
	let description : String?
	let __v : Int?
	let _active : Bool?
	let created_at : String?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case updated_at = "updated_at"
		case slug = "slug"
		case custom_module_eid = "custom_module_eid"
		case eid = "eid"
		case title = "title"
		case description = "description"
		case __v = "__v"
		case _active = "_active"
		case created_at = "created_at"
	}
    

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		custom_module_eid = try values.decodeIfPresent(String.self, forKey: .custom_module_eid)
		eid = try values.decodeIfPresent(String.self, forKey: .eid)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		_active = try values.decodeIfPresent(Bool.self, forKey: ._active)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
	}
    
    static func ==(lhs: Categories, rhs: Categories) -> Bool{
        return lhs._id ?? "" == rhs._id ?? ""
    }

}
