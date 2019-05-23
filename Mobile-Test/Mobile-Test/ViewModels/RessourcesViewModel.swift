//
//  RessourcesViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Result

protocol RessourcesViewModelInputs {
    func bind(outputs: RessourcesViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
    func didSelectRow(row: Int)
    func didPressFilter()
}

protocol RessourcesViewModelOutputs: class {
    func reloadData()
}

protocol RessourcesViewModelCoordinatorOutputs: class {
    func didAskToSeeRessource(ressource: Ressource)
}

class RessourcesViewModel: NSObject {
    var inputs: RessourcesViewModelInputs {return self}
    private weak var outputs: RessourcesViewModelOutputs!
    private weak var coordinatorOutputs: RessourcesViewModelCoordinatorOutputs!
    
    private var ressourceDataProvider: DecodableDataProvider<RessourceApi>
    private var ressourceType: RessourceApi
    
    private var filterAscending: Bool = true
    private var ressources: [Ressource]?
    
    init(coordinatorOutputs: RessourcesViewModelCoordinatorOutputs,
         ressourceType: RessourceApi,
         ressourceDataProvider: DecodableDataProvider<RessourceApi>) {
        
        self.coordinatorOutputs = coordinatorOutputs
        self.ressourceType = ressourceType
        self.ressourceDataProvider = ressourceDataProvider
    }
}

// MARK: - CategoriesViewModelInputs
extension RessourcesViewModel: RessourcesViewModelInputs {
    func bind(outputs: RessourcesViewModelOutputs) {
        self.outputs = outputs
    }
    
    func viewWillAppear() {
        switch self.ressourceType { // TODO: there is definitly something to be done here to make this prettier.
        case .restaurants:
            self.ressourceDataProvider.decodableRequest(self.ressourceType) { [weak self] (result: Result<[Restaurant], Error>) in
                guard let strongSelf = self else {return}
                switch result {
                case .success(let ressources):
                    strongSelf.ressources = RessourcesViewModel.filterRessource(ressources: ressources, filterAscending: strongSelf.filterAscending)
                    strongSelf.outputs.reloadData()
                case .failure(_):
                    fatalError("Not implemented")
                }
            }
        case .vacationSpots:
            self.ressourceDataProvider.decodableRequest(self.ressourceType) { [weak self] (result: Result<[VacationSpot], Error>) in
                guard let strongSelf = self else {return}
                switch result {
                case .success(let ressources):
                    strongSelf.ressources = RessourcesViewModel.filterRessource(ressources: ressources, filterAscending: strongSelf.filterAscending)
                    strongSelf.outputs.reloadData()
                case .failure(_):
                    fatalError("Not implemented")
                }
            }
        }
    }
    
    func didSelectRow(row: Int) {
        guard let ressources = self.ressources else {
            return
        }
        let ressourceSelected = ressources[row]
        
        self.coordinatorOutputs.didAskToSeeRessource(ressource: ressourceSelected)
    }
    
    func didPressFilter() {
        guard let ressources = self.ressources else {
            return
        }
        self.filterAscending = !self.filterAscending
        self.ressources = RessourcesViewModel.filterRessource(ressources: ressources, filterAscending: self.filterAscending)
        self.outputs.reloadData()
    }
    
    private static func filterRessource(ressources: [Ressource], filterAscending: Bool) -> [Ressource] {
        switch filterAscending {
        case true:
            return ressources.sorted(by: {$0.title < $1.title})
        case false:
            return ressources.sorted(by: {$0.title > $1.title})
        }
    }
}

// MARK: - UITableViewDataSource
extension RessourcesViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ressources?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ressources = self.ressources else {
            fatalError()
        }
        let ressourceForRow = ressources[indexPath.row]
        
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.config(withTitle: ressourceForRow.title, description: ressourceForRow.description, photoUrl: ressourceForRow.photo)
        
        return cell
    }
}
