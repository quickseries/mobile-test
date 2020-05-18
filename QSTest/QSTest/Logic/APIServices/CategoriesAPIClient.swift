//
//  CategoriesAPIClient.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

typealias APICategoriesSuccessCallback = (_ categories: Categories) -> Void

protocol CategoriesAPIClientProtocol {
    func getCategories(success: APICategoriesSuccessCallback?, failure: APIFailureCallback?)
}

class CategoriesAPIClient: APIHelper, CategoriesAPIClientProtocol {
    func getCategories(success: APICategoriesSuccessCallback?, failure: APIFailureCallback?) {
        self.get(path: standardPath(with: Constants.API.categoryPath),
                 params: nil,
                 successArray: { (response) in
                    let model: Categories = try decodeJSONOrThrow(response)
                    success?(model)
        },
                 failure: failure)
    }
}
