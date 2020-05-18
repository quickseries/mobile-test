//
//  ResourcesListFormatter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

class ResourcesListFormatter {
    static private func convert(_ restaurant: Restaurant) -> ResourceForUI {
        return ResourceForUI(id: restaurant.id,
                             title: restaurant.eid,
                             description: restaurant.restaurantDescription,
                             photo: restaurant.photo)
    }
    
    static func convert(_ restaurants: Restaurants) -> [ResourceForUI] {
        return restaurants.map { ResourcesListFormatter.convert($0) }
    }
    
    static private func convert(_ vacationSpot: VacationSpot) -> ResourceForUI {
        return ResourceForUI(id: vacationSpot.id,
                             title: vacationSpot.eid,
                             description: vacationSpot.vacationSpotDescription,
                             photo: vacationSpot.photo)
    }
    
    static func convert(_ vacationSpots: VacationSpots) -> [ResourceForUI] {
        return vacationSpots.map { ResourcesListFormatter.convert($0) }
    }
}
