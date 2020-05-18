//
//  ResourcesListController.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol ResourcesListControllerProtocol: AnyObject {
    var presenter: CategoriesPresenterProtocol? { get set }
    
    func show(rows: [ResourceForUI])
}


