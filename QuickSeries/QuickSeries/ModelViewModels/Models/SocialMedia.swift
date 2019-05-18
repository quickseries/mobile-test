



import Foundation
struct SocialMedia : Codable {
	let youtubeChannel : [String]?
	let twitter : [String]?
	let facebook : [String]?

	enum CodingKeys: String, CodingKey {

		case youtubeChannel = "youtubeChannel"
		case twitter = "twitter"
		case facebook = "facebook"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		youtubeChannel = try values.decodeIfPresent([String].self, forKey: .youtubeChannel)
		twitter = try values.decodeIfPresent([String].self, forKey: .twitter)
		facebook = try values.decodeIfPresent([String].self, forKey: .facebook)
	}

}
