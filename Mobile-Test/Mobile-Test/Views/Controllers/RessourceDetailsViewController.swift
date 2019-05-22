//
//  RessourceDetailsViewController.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class RessourceDetailsViewController: UIViewController, StoryboardBased {
    
    static var storyboardName: String = "Categories"
    
    private var viewModel: RessourceDetailsViewModel!
    
    static func instantiate(viewModel: RessourceDetailsViewModel) -> RessourceDetailsViewController {
        let ressourcesVC = RessourceDetailsViewController.instantiate()
        viewModel.bind(outputs: ressourcesVC)
        ressourcesVC.viewModel = viewModel
        return ressourcesVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.inputs.viewWillAppear()
    }
}

// MARK: - CategoriesViewModelOutputs
extension RessourceDetailsViewController: RessourceDetailsViewModelOutputs {
    
}
