//
//  ListModelProtocol.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit


protocol ListModelProtocol
{
    var id: String? { get set }
    var createdAt: Date? { get set }
    var title: String? { get set }
    var description: String? { get set }
    var type: HobbiesTypes? { get }
}

