//
//  RessourcesViewController.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class RessourcesViewController: UIViewController, StoryboardBased {
    
    static var storyboardName: String = "Categories"
    
    private var viewModel: RessourcesViewModel!
    
    static func instantiate(viewModel: RessourcesViewModel) -> RessourcesViewController {
        let ressourcesVC = RessourcesViewController.instantiate()
        viewModel.bind(outputs: ressourcesVC)
        return ressourcesVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.inputs.viewWillAppear()
    }
}

// MARK: - CategoriesViewModelOutputs
extension RessourcesViewController: RessourcesViewModelOutputs {
    func displayRessources(ressources: [Ressource]) {
        // TODO:
    }
}
