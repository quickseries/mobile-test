//
//  VacationSpotsAPIClient.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

typealias APIVacationSpotsSuccessCallback = (_ categories: VacationSpots) -> Void

protocol VacationSpotsAPIClientProtocol {
    func getVacationSpots(success: APIVacationSpotsSuccessCallback?, failure: APIFailureCallback?)
}

class VacationSpotsAPIClient: APIHelper, VacationSpotsAPIClientProtocol {
    func getVacationSpots(success: APIVacationSpotsSuccessCallback?, failure: APIFailureCallback?) {
        self.get(path: standardPath(with: Constants.API.vacationSpotPath),
                 params: nil,
                 successArray: { (response) in
                    let model: VacationSpots = try decodeJSONOrThrow(response)
                    success?(model)
        },
                 failure: failure)
    }
}
