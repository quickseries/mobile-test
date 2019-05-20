//
//  Ressource.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-20.
//  Copyright © 2019 Leopold. All rights reserved.
//

protocol Ressource where Self: Codable {
    var title: String {get}
    var description: String? {get}
}

extension VacationSpot: Ressource {
    
}

extension Restaurant: Ressource {
    
}

