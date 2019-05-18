


import Foundation
struct CategoryItem : Codable {
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
    let socialMedia : SocialMedia?

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
        case socialMedia = "socialMedia"
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
        socialMedia = try values.decodeIfPresent(SocialMedia.self, forKey: .socialMedia)
	}

}
