


import Foundation
struct Category : Codable {
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

}
