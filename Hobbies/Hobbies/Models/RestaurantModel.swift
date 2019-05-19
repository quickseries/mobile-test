//
//  RestaurantModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

class RestaurantModel: BaseModel, ListModelProtocol, ListDetailModelProtocol
{
    
    //MARK: - ListDetailModelProtocol
    var photo: String?
    var addresses: [AddressModel]?
    var businessHours: BusinessHourModel?
    var contactInfo: ContactInfoModel?
    
    //MARK: - ListModelProtocol
    var id: String?
    var title: String?
    var description: String?
    var createdAt: Date?
    var type: HobbiesTypes? {
        get {
            return .restaurants
        }
    }
    
    //MARK: - BaseModel
    var updatedAt: Date?
    var active: Bool?
    
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
        createdAt          <- (map["created_at"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"))
        photo              <- map ["photo"]
        addresses          <- map ["addresses"]
        contactInfo        <- map ["contactInfo"]
        businessHours      <- map ["bizHours"]
    }

}
