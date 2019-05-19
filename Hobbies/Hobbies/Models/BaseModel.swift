//
//  BaseModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

public class BaseModel: Mappable
{
    public required init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
    }
    
    public required convenience init?()
    {
        self.init(map: Map(mappingType: .fromJSON, JSON: ["" : ""]))
    }
}
