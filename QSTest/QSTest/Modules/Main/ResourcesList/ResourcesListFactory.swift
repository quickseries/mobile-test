//
//  ResourcesListFactory.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol ResourcesListFactoryProtocol {
    func createResourcesListModule(delegate: ResourcesListPresenterDelegate,
                                   state: ResourcesState) -> ResourcesListController
}

class ResourcesListFactory: ResourcesListFactoryProtocol {
    func createResourcesListModule(delegate: ResourcesListPresenterDelegate,
                                   state: ResourcesState) -> ResourcesListController {
        let controller = ResourcesListController(loadType: .xib)
        let _ = ResourcesListPresenter(controller: controller,
                                       delegate: delegate,
                                       state: state)

        return controller
    }
}
