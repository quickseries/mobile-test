//
//  FreeText.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation

struct FreeText : Codable {

//    enum CodingKeys: String, CodingKey {
//
//    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        print(values)
	}

}
