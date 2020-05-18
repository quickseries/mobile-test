//
//  UIViewController+Ext.swift
//  QuickSeries
//
//  Created by Parth Patel on 14/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import Messages
import MapKit

fileprivate var containerView: UIView!

extension UIViewController: MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{

    enum ViewControllerSegue: String {
        case showResources
        case showResourceDetail
    }
    
    // MARK: - Handle UIAlert
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true)
        }
    }
    
    
    // MARK: - Handle Loading View
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    // MARK: - Handle Safari View
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    // MARK: - Handle Email
    
    func sendEmail(email: String) {
        let recipientEmail = email
        let subject = "Quick Series"
        let body = ""
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            present(mail, animated: true)
        } else {
            presentAlertOnMainThread(title: "Alert", message: "Can't send email.", buttonTitle: "OK")
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    // MARK: - Handle Call
    
    func callInterface(number: String) {
        guard let callURL = URL(string: "tel://" + number) else { return }
        if UIApplication.shared.canOpenURL(callURL) {
            UIApplication.shared.open(callURL)
        } else {
            presentAlertOnMainThread(title: "Alert", message: "Can't make a call.", buttonTitle: "OK")
        }
        
    }
    
    
    // MARK: - Handle Message
    
    func displayMessageInterface(number: String) {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = [number]
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            presentAlertOnMainThread(title: "Alert", message: "Can't send messages.", buttonTitle: "OK")
        }
    }
    
    public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }

    
    // MARK: - Handle Map
    
    func openAppleMap(latValue: String, longValue: String) {
        let latitude: CLLocationDegrees = (latValue as NSString).doubleValue
        let longitude: CLLocationDegrees = (longValue as NSString).doubleValue
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
        source.name = "Source"
        MKMapItem.openMaps(with: [source], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])

    }
}

