//
//  Ressource.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-20.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation

protocol Ressource where Self: Codable {
    var title: String {get}
    var description: String? {get}
    var photo: URL? {get}
}

extension VacationSpot: Ressource {
    
}

extension Restaurant: Ressource {
    
}

