//
//  LocationDetailsViewController.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices
import CoreLocation
import MapKit

class LocationDetailsViewController: UIViewController {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contactInfoStackView: UIStackView!
    @IBOutlet weak var addressesStackView: UIStackView!
    @IBOutlet weak var bizHoursStackView: UIStackView!
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        descriptionLabel.text = nil
        descriptionLabel.attributedText = nil
        
        guard let location = location else { return }
        
        title = location.title
        
        
        let task = URLSession(configuration: .default).dataTask(with: location.photoURL) { (data, response, error) in
            if let fetchedData = data {
                let image = UIImage(data: fetchedData)
                DispatchQueue.main.async {
                    self.photoView.image = image
                }
            }
        }
        task.resume()
        
        
        if let description = location.description {
            let htmlData = NSString(string: description).data(using: String.Encoding.utf8.rawValue)
            let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
            let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
                                                                      options: options,
                                                                      documentAttributes: nil)
            
            
            
            descriptionLabel.text = attributedString?.string
        }
        
        
        if let phones = location.contactInfo.phoneNumber {
            for phone in phones {
                if !phone.isEmpty {
                    let view = createPhoneView("PHONE NUMBER", phone: phone)
                    contactInfoStackView.addArrangedSubview(view)
                }
            }
        }
        
        if let tollfreePhones = location.contactInfo.tollFree {
            for phone in tollfreePhones {
                if !phone.isEmpty {
                    let view = createPhoneView("TOLL-FREE NUMBER", phone: phone)
                    contactInfoStackView.addArrangedSubview(view)
                }
            }
        }
        
        if let faxes = location.contactInfo.faxNumber {
            for fax in faxes {
                if !fax.isEmpty {
                    let view = createPhoneView("FAX NUMBER", phone: fax)
                    view.isActionable = false
                    contactInfoStackView.addArrangedSubview(view)
                }
            }
        }
        
        if let emails = location.contactInfo.email {
            for email in emails {
                if !email.isEmpty {
                    let view = createSingleActionView(title: "EMAIL ADDRESS", detail: email)
                    view.actionImage = UIImage(systemName: "envelope.fill")
                    
                    view.onAction = {
                        if MFMessageComposeViewController.canSendText() {
                            let vc = MFMessageComposeViewController()
                            vc.recipients = [email]
                            
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                    
                    contactInfoStackView.addArrangedSubview(view)
                }
            }
        }
        
        if let sites = location.contactInfo.website {
            for site in sites {
                let view = createSingleActionView(title: "WEBSITE", detail: site.absoluteString)
                view.actionImage = UIImage(systemName: "link")
                
                view.onAction = {
                    let vc = SFSafariViewController(url: site)
                    self.present(vc, animated: true, completion: nil)
                }
                
                contactInfoStackView.addArrangedSubview(view)
            }
        }
        
        
        if let addresses = location.addresses {
            for address in addresses {
                let view = createAddressView(address)
                addressesStackView.addArrangedSubview(view)
            }
        }
        
        if let bizHours = location.bizHours {
            for hour in bizHours {
                let view = createBizHoursView(hour.key, info: hour.value)
                bizHoursStackView.addArrangedSubview(view)
            }
        }
    }
    
    
    private func createSingleActionView(title: String, detail: String) -> SingleActionView {
        let view = UINib(nibName: "SingleActionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SingleActionView
        view.titleLabel.text = title
        view.detailLabel.text = detail
        view.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        return view
    }
    
    private func createAddressView(_ address: Address) -> SingleActionView {
        let view = UINib(nibName: "SingleActionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SingleActionView
        view.titleLabel.text = "ADDRESS"
        
        let street = address.address ?? ""
        let city = address.city ?? ""
        let state = address.state ?? ""
        let zipCode = address.zipCode ?? ""
        let country = address.country ?? ""
        
        
        view.detailLabel.text = "\(street)\n\(city), \(state) \(zipCode)\n\(country)"
        view.actionImage = UIImage(systemName: "map.fill")
        
        if let coordinates =  address.coordinates {
            let lat = Double(coordinates.latitude) ?? 0
            let long = Double(coordinates.longitude) ?? 0
            
            let coordinate = CLLocationCoordinate2DMake(lat, long)
            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary:nil)
            let mapItem = MKMapItem(placemark: placemark)

            mapItem.name = address.label

            let regionDistance:CLLocationDistance = 10000
            let regionSpan = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            
            view.onAction = {
                mapItem.openInMaps(launchOptions: options)
            }
        } else {
            view.isActionable = false
        }
        
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        return view
    }
    
    private func createPhoneView(_ title: String, phone: String) -> PhoneView {
        let view = UINib(nibName: "PhoneView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PhoneView
        view.titleLabel.text = title
        view.detailLabel.text = phone
        
        view.onMessage = {
            if MFMessageComposeViewController.canSendText() {
                let vc = MFMessageComposeViewController()
                vc.recipients = [phone]
                
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        view.onCall = {
            let telURL = URL(string: "tel://\(phone)")!
            UIApplication.shared.open(telURL, options: [:], completionHandler: nil)
        }
        
        view.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        return view
    }
    
    private func createBizHoursView(_ day: String, info: [String: String]) -> BizHoursView {
        let view = UINib(nibName: "BizHoursView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BizHoursView
        
        view.dayLabel.text = day
        
        let from = info["from"] ?? ""
        let to = info["to"] ?? ""
        
        view.hoursLabel.text = "\(from)-\(to)"
        
        return view
    }
}
