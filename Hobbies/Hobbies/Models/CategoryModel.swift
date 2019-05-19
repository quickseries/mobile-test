//
//  CategoryModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

public class CategoryModel: BaseModel, ListModelProtocol
{
    var type: HobbiesTypes? {
        get {
            if self.slug == "restaurants" { return .restaurants }
            if self.slug == "vacation-spots" { return .vacations }
            return .categories
        }
    }
    
    var id: String?
    var slug: String?
    var updatedAt: Date?
    var title: String?
    var description: String?
    var active: Bool?
    var createdAt: Date?
    
    public required init?(map: Map)
    {
        super.init(map: map)
    }
    
    public override func mapping(map: Map)
    {
        super.mapping(map: map)
        
        id                 <- map["_id"]
        title              <- map["title"]
        updatedAt          <- (map["updated_at"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"))
        description        <- map["description"]
        active             <- map["_active"]
        slug               <- map["slug"]
        createdAt          <- (map["created_at"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"))
    }
}
