//
//  ResourceDetailViewModel.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class ResourceDetailViewModel {
    let title: String
    let resourceInformations: [ResourceInformationViewModel]
    init(title: String, resourceInformations: [ResourceInformationViewModel]) {
        self.title = title
        self.resourceInformations = resourceInformations
    }
}

class ResourceInformationViewModel {
    enum InformationButtonType {
        case location
        case email
        case website
        case phoneNumber
    }
    let labelText: String
    let url: URL?
    let buttonType: InformationButtonType
    init(labelText: String, buttonAction: URL?, informationButtonType: InformationButtonType) {
        self.labelText = labelText
        self.url = buttonAction
        self.buttonType = informationButtonType
    }
}
