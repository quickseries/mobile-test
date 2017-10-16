//
//  GenericViewController.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-12.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit
import SafariServices
import CoreLocation
import MapKit
import MessageUI

class GenericViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func open(url:URL) {
        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true)
    }
    
    func openMap( lat:Double, lng:Double,placeName:String) {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = lng
        
        let regionDistance:CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: options)
    }
    
    func openAddress(forAddress address: String, placeName:String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                return
            }
            self.openMap(lat: (placemarks?.first?.location?.coordinate.latitude)!, lng: (placemarks?.first?.location?.coordinate.longitude)!, placeName: placeName)
        }
    }
    
    func sendEmail(to:String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.setToRecipients([to])
            mail.mailComposeDelegate = self
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func call(phone:String) {
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

extension GenericViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension GenericViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
