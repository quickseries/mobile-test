//
//  ListDetailModelProtocol.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

protocol ListDetailModelProtocol: ListModelProtocol
{
    var photo: String? { get set }
    var addresses: [AddressModel]? { get set }
    var businessHours: BusinessHourModel? { get set }
    var contactInfo: ContactInfoModel? { get set }
}
