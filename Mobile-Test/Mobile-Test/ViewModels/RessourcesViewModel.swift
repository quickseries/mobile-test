//
//  RessourcesViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

protocol RessourcesViewModelInputs {
    func bind(outputs: RessourcesViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
}

protocol RessourcesViewModelOutputs: class {
    func displayRessources(ressources: [Ressource])
}

protocol RessourcesViewModelCoordinatorOutputs: class {
    
}

class RessourcesViewModel {
    var inputs: RessourcesViewModelInputs {return self}
    private weak var outputs: RessourcesViewModelOutputs!
    private weak var coordinatorOutputs: RessourcesViewModelCoordinatorOutputs!
    
    private var vacationSpotDatasource: VacationSpotDatasource
    private var restaurantsDatasource: RestaurantsDatasource
    
    init(coordinatorOutputs: RessourcesViewModelCoordinatorOutputs,
         vacationSpotDatasource: VacationSpotDatasource,
         restaurantsDatasource: RestaurantsDatasource) {
        
        self.coordinatorOutputs = coordinatorOutputs
        self.vacationSpotDatasource = vacationSpotDatasource
        self.restaurantsDatasource = restaurantsDatasource
    }
}

// MARK: - CategoriesViewModelInputs
extension RessourcesViewModel: RessourcesViewModelInputs {
    func bind(outputs: RessourcesViewModelOutputs) {
        self.outputs = outputs
    }
    
    func viewWillAppear() {
        let vacationSpots: [Ressource] = self.vacationSpotDatasource.load()
        let restaurants: [Ressource] = self.restaurantsDatasource.load()
        let ressources: [Ressource] = vacationSpots + restaurants
        self.outputs.displayRessources(ressources: ressources)
    }
}

protocol Ressource {
    
}

extension VacationSpot: Ressource {
    
}

extension Restaurant: Ressource {
    
}
