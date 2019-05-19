//
//  ResourceDetailsRouter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation
import CoreLocation

protocol ResourceDetailsRouter {
    
}

class ResourceDetailsRouterImpl: ResourceDetailsRouter {
    
    private weak var viewController: ResourceDetailsViewController?
    
    init(viewController: ResourceDetailsViewController) {
        self.viewController = viewController
    }
}

extension ResourceDetailsRouterImpl: ContactInfoTableViewCellDelegate {
    
    func tappedAction(with type: ContactActionType, address: ResourceAddress) {
        switch type {
        case .address:
            if let latlng = address.latLng {
                let coordinates = CLLocationCoordinate2DMake(latlng.latitude, latlng.longitude)
                NavigationUtility.openLocationInMaps(with: coordinates, placeName: address.completeAddress)
            }
        default:
            break
        }
    }
    
    func tappedAction(with type: ContactActionType, info: ContactInfo) {
        switch type {
        case .sms: NavigationUtility.openiMessage(with: info.contact)
        case .call: NavigationUtility.makeACall(with: info.contact)
        case .email: NavigationUtility.openEmailComposer(with: info.contact)
        case .website: NavigationUtility.openSafari(with: info.contact, controller: viewController)
        case .address:  break
        }
    }
    
    func tappedAction(with type: ContactActionType, media: SocialMedia) {
        switch type {
        case .website: NavigationUtility.openGeneralUrl(with: media.link)
        default:
            break
        }
    }
}
