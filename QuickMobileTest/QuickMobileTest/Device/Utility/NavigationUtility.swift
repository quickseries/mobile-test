//
//  NavigationUtility.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation
import UIKit
import SafariServices
import MapKit
import CoreLocation

struct NavigationUtility {
    
    static func makeACall(with number: String) {
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func openiMessage(with number: String) {
        if let url = URL(string: "sms://\(number)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func openEmailComposer(with email: String) {
        if let url = URL(string: "mailto://\(email)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func openSafari(with link: String, controller: UIViewController?) {
        if let url = URL(string: link) {
            let sfController = SFSafariViewController(url: url)
            controller?.present(sfController, animated: true, completion: nil)
        }
    }
    
    static func openLocationInMaps(with coordinates: CLLocationCoordinate2D, placeName: String?) {
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: nil)
    }
    
    static func openGeneralUrl(with urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
