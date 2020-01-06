//  TappableInformation.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

struct TappableInformation {
    let type: InformationType
    let content: String
}

enum InformationType {
    case phoneNumber
    case tollFreeNumber
    case faxNumber
    case email
    case website
    case address(location: Location)
}

extension InformationType {
    
    var title: String {
        switch self {
        case .phoneNumber: return "Phone Number"
        case .tollFreeNumber: return "Toll-Free Number"
        case .faxNumber: return "Fax Number"
        case .email: return "Email Adress"
        case .website: return "Website"
        case .address: return "Address"
        }
    }
    
    var trailingIcon: String {
        switch self {
        case .phoneNumber, .tollFreeNumber: return "📞"
        case .faxNumber: return "📠"
        case .email: return "📨"
        case .website: return "🧭"
        case .address: return "📍"
        }
    }
}
