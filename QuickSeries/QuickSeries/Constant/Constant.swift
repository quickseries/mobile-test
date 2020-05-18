//
//  Constant.swift
//  QuickSeries
//
//  Created by Parth Patel on 16/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

enum ContactStrings: String {
    case phoneNumberText = "PHONE NUMBER"
    case tollFreeNumberText = "TOLL-FREE NUMBER"
    case faxNumberText = "FAX NUMBER"
    case emailText = "EMAIL"
    case websiteText = "WEBSITE"
}

enum ButtonType: Int {
    case Call = 1, Message, Email, Website
}
