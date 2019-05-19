//
//  Restaurant.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public class Restaurant: CategoryResource  {
    
    public let businessHours: BusinessHours?
    
    private enum CodingKeys: String, CodingKey {
        case businessHours = "businessHours"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        businessHours = try container.decodeIfPresent(BusinessHours.self, forKey: CodingKeys.businessHours)
        try super.init(from: decoder)
    }
}
