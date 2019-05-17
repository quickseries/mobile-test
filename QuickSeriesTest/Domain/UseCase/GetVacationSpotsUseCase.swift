//
//  GetVacationSpotsUseCase.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift

public protocol GetVacationSpotsUseCase {
  func getVacationSpots(requestParameter: VacationSpotNetworkModel.Request) -> Observable<[VacationSpotNetworkModel.Response]>
}
