//
//  CategoriesPresenter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol CategoriesPresenterDelegate: AnyObject {
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect restaurants: Restaurants)
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect vacationSpots: VacationSpots)
}

protocol CategoriesPresenterProtocol: BasePresenterProtocol {
    func onSelectCategory(categoryId: String)
}

class CategoriesPresenter {
    private weak var delegate: CategoriesPresenterDelegate?
    private weak var controller: CategoriesControllerProtocol?
    
    private let categoriesAPI: CategoriesAPIClientProtocol!
    private let restaurantsAPI: RestaurantsAPIClientProtocol!
    private let vacationSpotsAPI: VacationSpotsAPIClientProtocol!
    
    private var categories: Categories = []
    
    init(controller: CategoriesControllerProtocol,
         delegate: CategoriesPresenterDelegate,
         categoriesAPI: CategoriesAPIClientProtocol = CategoriesAPIClient(),
         restaurantsAPI: RestaurantsAPIClientProtocol = RestaurantsAPIClient(),
         vacationSpotsAPI: VacationSpotsAPIClientProtocol = VacationSpotsAPIClient()) {
        self.controller = controller
        self.delegate = delegate
        
        self.categoriesAPI = categoriesAPI
        self.restaurantsAPI = restaurantsAPI
        self.vacationSpotsAPI = vacationSpotsAPI
        
        self.controller?.presenter = self
    }
}

// MARK: - Private methods
private extension CategoriesPresenter {
    func fetchCategories() {
        controller?.showLoadingController(aboveNavBar: true)
        categoriesAPI.getCategories(success: { [weak self] (categories) in
            guard let self = self else { return }
            
            self.update(with: categories)
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                
                self.handle(error: error)
            })
    }
    
    func update(with categories: Categories) {
        self.controller?.hideLoadingController()
        self.categories = categories
        let modelsForUI = CategoriesFormatter.convert(categories)
        controller?.show(rows: modelsForUI)
    }
    
    func handleRestaurantsSelection() {
        restaurantsAPI.getRestaurants(success: { [weak self] (restaurants) in
        guard let self = self else { return }
        
        self.proceed(with: restaurants)
        }, failure: { [weak self] (error) in
            guard let self = self else { return }
            
            self.handle(error: error)
        })
    }
    
    func handleVacationSpotsSelection() {
        vacationSpotsAPI.getVacationSpots(success: { [weak self] (vacationSpots) in
            guard let self = self else { return }
            
            self.proceed(with: vacationSpots)
        }, failure: { [weak self] (error) in
            guard let self = self else { return }
            
            self.handle(error: error)
        })
    }
    
    func handle(error: NSError) {
        self.controller?.hideLoadingController()
        self.controller?.show(error: error)
    }
    
    func proceed(with restaurants: Restaurants) {
        self.controller?.hideLoadingController()
        delegate?.presenter(self, didSelect: restaurants)
    }
    
    func proceed(with vacationSpots: VacationSpots) {
        self.controller?.hideLoadingController()
        delegate?.presenter(self, didSelect: vacationSpots)
    }
}

extension CategoriesPresenter: CategoriesPresenterProtocol {
    func onSelectCategory(categoryId: String) {
        guard let category = categories.first(where: { $0.eid == categoryId }) else { return }
        
        controller?.showLoadingController(aboveNavBar: true)
        
        switch category.slug {
        case .restaurants: handleRestaurantsSelection()
        case .vacationSpots: handleVacationSpotsSelection()
        }
    }
    
    func onViewDidLoad() {
        controller?.set(title: Constants.Titles.categoriesKey.localized)
        fetchCategories()
    }
}
