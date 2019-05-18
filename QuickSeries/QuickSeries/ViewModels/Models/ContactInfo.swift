




import Foundation
struct ContactInfo : Codable {
	let website : [String]?
	let email : [String]?
	let phoneNumber : [String]?
    let faxNumber : [String]?
    let tollFree : [String]?
	enum CodingKeys: String, CodingKey {

		case website = "website"
		case email = "email"
		case phoneNumber = "phoneNumber"
        case faxNumber = "faxNumber"
        case tollFree = "tollFree"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		website = try values.decodeIfPresent([String].self, forKey: .website)
		email = try values.decodeIfPresent([String].self, forKey: .email)
		phoneNumber = try values.decodeIfPresent([String].self, forKey: .phoneNumber)
        faxNumber = try values.decodeIfPresent([String].self, forKey: .faxNumber)
        tollFree = try values.decodeIfPresent([String].self, forKey: .tollFree)
	}

}
