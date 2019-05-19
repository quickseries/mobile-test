//
//  AddressModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

class AddressModel: BaseModel
{
    var address1: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var country: String?
    var label: String?

    public required init?(map: Map)
    {
        super.init(map: map)
    }
    
    public override func mapping(map: Map)
    {
        super.mapping(map: map)
        
        address1                 <- map["address1"]
        city                     <- map["city"]
        state                    <- map["state"]
        zipCode                  <- map["zipCode"]
        country                  <- map["country"]
        label                    <- map["label"]
    }
}
