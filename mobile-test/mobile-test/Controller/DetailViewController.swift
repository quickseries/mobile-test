//
//  DetailViewController.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import MapKit

class DetailViewController: UIViewController {
    
    var resource: Resource?
    var dataSource = ResourceDetailDelegate()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.register(DetailImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(SocialMediaCell.self, forCellReuseIdentifier: "SocialMediaCell")
        tableView.register(AddressCell.self, forCellReuseIdentifier: "AddressCell")
        tableView.register(PhoneCell.self, forCellReuseIdentifier: "PhoneCell")
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        title = resource?.title ?? "Resources"
        dataSource.resource = resource
        view.backgroundColor = .white
        [tableView].forEach({ view.addSubview($0) })
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .zero,size: .zero)
        dataSource.facebookSelected = { [unowned self] in
            self.openLink(urlString: self.dataSource.facebookUrl)
        }
        dataSource.twitterSelected = { [unowned self] in
            self.openLink(urlString: self.dataSource.twitterUrl)
        }
        dataSource.youtubeSelected = { [unowned self] in
            self.openLink(urlString: self.dataSource.youtubeUrl)
        }
        dataSource.callButtonSelected = { [unowned self] in
            self.openUrl(url: self.dataSource.callNo)
        }
        dataSource.messageButtonSelected = { [unowned self] in
            self.sendSMS(phoneNumber: self.dataSource.messageNo)
        }
        dataSource.emailSelected = { [unowned self] in
            self.sendEmail(email: self.dataSource.email)
        }
        dataSource.websiteSelected = { [unowned self] in
            self.openLink(urlString: self.dataSource.website)
        }
        dataSource.locationSelected = { [unowned self] in
            self.openMap(location: self.dataSource.location, locationName: self.dataSource.resource?.title ?? "")
        }
    }
    
    func openMap(location: Gps?, locationName: String) {
        guard let location = location else { return }
        let coordinate = CLLocationCoordinate2DMake((location.latitude as NSString).doubleValue, (location.longitude as NSString).doubleValue)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.02))
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)]
        mapItem.name = locationName
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    func openLink(urlString: String?) {
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        let linkVC = SFSafariViewController(url: url)
        self.present(linkVC, animated: true, completion: nil)
    }
    
    func openUrl(url: String)
    {
        guard let number = URL(string: "tel://" + url) else { return }
        UIApplication.shared.open(number)
    }
    
}

extension DetailViewController: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func sendSMS(phoneNumber: String) {
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
}

extension DetailViewController: MFMailComposeViewControllerDelegate {
    func sendEmail(email: String) {
        let mailComposeViewController = configuredMailComposeViewController(email: email)
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController(email: String) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([email])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send Email.  Please check Email configuration and try again.", preferredStyle: .alert)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}






