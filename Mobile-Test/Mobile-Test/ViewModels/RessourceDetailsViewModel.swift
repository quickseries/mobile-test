//
//  RessourceDetailsViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

protocol RessourceDetailsViewModelInputs {
    func bind(outputs: RessourceDetailsViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
}

protocol RessourceDetailsViewModelOutputs: class {
    
}

protocol RessourceDetailsViewModelCoordinatorOutputs: class {
    
}

class RessourceDetailsViewModel {
    var inputs: RessourceDetailsViewModelInputs {return self}
    private weak var outputs: RessourceDetailsViewModelOutputs!
    private weak var coordinatorOutputs: RessourceDetailsViewModelCoordinatorOutputs!
    
    private var ressource: Ressource
    
    init(coordinatorOutputs: RessourceDetailsViewModelCoordinatorOutputs, ressource: Ressource) {
        self.coordinatorOutputs = coordinatorOutputs
        self.ressource = ressource
    }
}

// MARK: - CategoriesViewModelInputs
extension RessourceDetailsViewModel: RessourceDetailsViewModelInputs {
    func bind(outputs: RessourceDetailsViewModelOutputs) {
        self.outputs = outputs
    }
    
    func viewWillAppear() {

    }
}
