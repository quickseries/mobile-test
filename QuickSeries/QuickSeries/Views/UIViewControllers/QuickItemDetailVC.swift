//
//  QuickItemDetailVC.swift
//  QuickSeries
//
//  Created by Engineer 144 on 18/05/2019.
//

import UIKit
import Eureka
import ViewRow
import SafariServices
import MessageUI
import MapKit
import CoreLocation

class QuickItemDetailVC: FormViewController,SFSafariViewControllerDelegate,MFMailComposeViewControllerDelegate {
    
    lazy var activeLat = 0.0
    lazy var activeLog = 0.0
    lazy var activePhoneNumber = ""
    lazy var activeEmail = ""
    lazy var activeURL = ""
    
     var activeSocialLink : SocialMedia?
     var activeAddress : Addresses?
     var itemDetails : CategoryItemViewModel!
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         //TODO ADD KVO's
        buildViews()
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
     //   reQuestLocationMapAuth()
    }
    
    

    func buildViews()  {
      
        //TITLE HEADER
        form +++
            TitleHeader()
        
        self.form +++
            
            
            
            ///DESCRIPTION
            TestAreaRow(value: self.itemDetails.categoryItem.description?.htmlToString ?? "")
        
        
            //CONTACT INFORMATION SECTION
        
        +++ Section("CONTACT INFORMATION")
        for item in itemDetails.categoryItem.contactInfo?.phoneNumber ?? [] {
            
            if (!item.isEmpty){
                self.form.last?.append(ShortContactViewRow(value: ("PHONE NUMBER",item.internationaLizedString() ), type: RowTpe.phone))
            }
            
            
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.tollFree ?? [] {
            if (!item.isEmpty){
                self.form.last?.append(ShortContactViewRow(value: ("TOLL-FREE NUMBER",item.internationaLizedString() ), type: RowTpe.phone))
            }
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.faxNumber ?? [] {
            if (!item.isEmpty){
                self.form.last?.append(ShortContactViewRow(value: ("FAX NUMBER",item.internationaLizedString() ), type: RowTpe.fax))
            }
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.email ?? [] {
            if (!item.isEmpty){
                self.form.last?.append(ShortContactViewRow(value: ("EMAIL ADDRESS",item ), type: RowTpe.email))
            }
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.website ?? [] {
            if (!item.isEmpty){
                self.form.last?.append(ShortContactViewRow(value: ("WEBSITE",item ), type: RowTpe.website))
            }
        }
        
        
        ///ADDRESS SECTION
        if (itemDetails.shouldShowAddress) {
            
            self.form +++ Section("ADDRESSS")
            for item in itemDetails.categoryItem.addresses ?? [] {
                self.form.last?.append(LongContactViewRow(address: item))
            }
        }
    
        
        
        //SOCIAL MEDIA LINKS
        if itemDetails.categoryItem.socialMedia != nil {
            self.form +++ Section("SOCIAL MEDIA")
            
            self.form.last?.append(SocialViewRow(address: itemDetails.categoryItem.socialMedia!))
        }
       
        
        
        //WORKING DAYS
        self.form +++ Section("BUSINESS HOURS")
        var value = ""
        for item in itemDetails.workingDays {
            
        
            
            if (item.1 == " - " || item.1.isEmpty){
                value = "Closed"
            }else{
                value = item.1
            }
            
              self.form.last?.append(CustomLabelRow(key: item.0, value: value) )
            
        }
        
       
        
    }
    
    
    
   @IBAction func dismissMe(_ sender: Any) {
    
    presentingViewController?.dismiss(animated: true, completion: nil)
}
    
    
   
    
    

}































//FOR MAP AND LOCATION USE
extension QuickItemDetailVC : CLLocationManagerDelegate{
   
    
    func reQuestLocationMapAuth(){
        let locationManager = CLLocationManager()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        self.activeLat = locValue.latitude
        self.activeLat = locValue.longitude
       
    }

}



extension QuickItemDetailVC {
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
        switch result {
        case .cancelled:
           alert(title: "Failed", body: "Canceled")
            controller.dismiss(animated: true, completion: nil)
        case .failed:
            alert(title: "Failed", body: "failed")
            controller.dismiss(animated: true, completion: nil)
        case .sent:
             alert(title: "Success", body: "Sent")
            controller.dismiss(animated: true, completion: nil)
        case .saved:
           alert(title: "Success", body: "Saved")
            controller.dismiss(animated: true, completion: nil)
        default:
            break
        }
        
    }
    

}






///OBJC ACTION METHODS FOR UIVIEWS

extension QuickItemDetailVC {
    
    
    @objc func openYouYub(){
        
        let urlString = self.activeSocialLink?.youtubeChannel?[0] ?? ""
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            
            present(vc, animated: true)
        }else{
            
            alert(title: "Error", body: "Cannot open URL")
        }
        print("i was called \(activeURL)")
    }
    
    @objc func openTwit()
    {
         let urlString = self.activeSocialLink?.twitter?[0] ?? ""
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            
            present(vc, animated: true)
        }else{
            
            alert(title: "Error", body: "Cannot open URL")
        }
        print("i was called \(activeURL)")
    }
    
    @objc func openFace()
    {
         let urlString = self.activeSocialLink?.facebook?[0] ?? ""
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            
            present(vc, animated: true)
        }else{
            
            alert(title: "Error", body: "Cannot open URL")
        }
        print("i was called \(activeURL)")
    }
    
    
    @objc func openPhone()
    {
        
        
        self.activePhoneNumber.makeACall()
        print("i was called \(self.activePhoneNumber) to make a callc")
    }
    
    @objc func openURL()
    {
        let urlString = activeURL
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            
            present(vc, animated: true)
        }else{
            
            alert(title: "Error", body: "Cannot open URL")
        }
        print("i was called \(activeURL)")
    }
    
    @objc func openMail()
    {
        if MFMailComposeViewController.canSendMail()
        {
        let title = ""
        let body = ""
        let toRecipents = [activeEmail]
        let mailView: MFMailComposeViewController = MFMailComposeViewController()
        mailView.mailComposeDelegate = self
        mailView.setSubject(title)
        mailView.setMessageBody(body, isHTML: false)
        mailView.setToRecipients(toRecipents)
      
        self.navigationController?.present(mailView, animated: true, completion: nil)

      
        }else{
            
            alert(title: "Error", body: "Cannot send email from this device")
            
        }
    }
    
    @objc func openMap()
    {
        print("map was called")
        //Get user current location to enable destination and navigation
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: self.activeLat, longitude: self.activeLog)))
        source.name = "My Current Location"
        
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: Double( activeAddress?.gps?.latitude ?? "0.00" ) ?? 0.0,
                                                                                              longitude: Double(activeAddress?.gps?.longitude ?? "0.00") ?? 0.0)))
        destination.name = activeAddress?.address1 ?? ""
        
        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

////Eureka Cells extension for class
extension QuickItemDetailVC {
    
    
    
    func CustomLabelRow (key: String,value: String)->LabelRow{
        
      let view = LabelRow () {
            $0.title = key
            $0.value = value
            $0.tag = UUID.init().uuidString
            }
            .onCellSelection { cell, row in
                //  row.title = (row.title ?? "") + " 🇺🇾 "
                // row.reload() // or row.updateCell()
        }
        
        return view
    }
    func SocialViewRow(address: SocialMedia)-> ViewRow<SocialMediaViewFile> {
    
    let viewRow = ViewRow<SocialMediaViewFile>() { (row) in
        
        row.tag = UUID.init().uuidString
        }
        .cellSetup { (cell, row) in
            //  Construct the view
            let bundle = Bundle.main
            let nib = UINib(nibName: "SocialMediaView", bundle: bundle)
            
            cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? SocialMediaViewFile
            cell.view?.backgroundColor = cell.backgroundColor
            cell.height =  { 50 }
            print("LINK \(address.facebook?[0] ?? "")")
            
            
            
            self.activeSocialLink = address
            
            let openFace = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openFace))
            let openT = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openTwit))
            let you = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openYouYub))
            
             cell.view?.iconOne.addGestureRecognizer(openFace)
            
             cell.view?.iconTwo.addGestureRecognizer(openT)
             cell.view?.iconThree.addGestureRecognizer(you)
            
            
            
            cell.frame.insetBy(dx: 5.0, dy: 5.0)
            cell.selectionStyle = .none
            
        }.onCellSelection() {_,_ in
            
            
            
    }
    
    
    return viewRow
    
}
    func TitleHeader() ->Section {
    let section  =  Section() { section in
        var header = HeaderFooterView<HeaderViewFile>(.nibFile(name: "HeaderView", bundle: nil))
        header.onSetupView = { view, _ in
            
            view.logo.setImageWithTransaction(url: self.itemDetails.categoryItem.photo ?? "")
            view.titleLabel.text = self.itemDetails.categoryItem.title ?? ""
        }
        section.header = header
    }
    
    
    return section
    
}
    func ShortContactViewRow(value: (String,String),type: RowTpe)-> ViewRow<ContactViewCellFile> {
        
        let viewRow = ViewRow<ContactViewCellFile>(value.0) { (row) in
            
            row.tag = UUID.init().uuidString
            }
            .cellSetup { (cell, row) in
                //  Construct the view
                let bundle = Bundle.main
                let nib = UINib(nibName: "ContactViewCell", bundle: bundle)
                
                cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? ContactViewCellFile
                cell.view?.backgroundColor = cell.backgroundColor
                cell.height =  { 50 }
                cell.view?.titleLabel.text = value.0
                cell.view?.valueLabel.text = value.1
                cell.selectionStyle = .default
                
                switch(type){
                    
                case .email:
                    
                    cell.view?.accessoryOne.isHidden = true
                    cell.view?.accessoryTwo.image =  UIImage(named: "email")
                 
                    
                    
                
                case .phone:
                    cell.view?.accessoryOne.isHidden  = true
                    cell.view?.accessoryTwo.image =  UIImage(named: "phone")
                 
                    
                  
                  
                   
                case .fax:
                     cell.view?.accessoryOne.isHidden = true
                     cell.view?.accessoryTwo.isHidden = true
                    
                case .website:
                    
                    self.activeURL = value.1
                    cell.view?.accessoryOne.isHidden = true
                    cell.view?.accessoryTwo.image = UIImage(named: "website")
                   
                }
                
                cell.view?.valueLabel.adjustsFontSizeToFitWidth = true
                cell.frame.insetBy(dx: 10.0, dy: 10.0)
                cell.selectionStyle = .none
                
            }.onCellSelection() {_,_ in
                
                
                
                switch(type){
                    
                case .email:
                     self.activeEmail = value.1
                    self.openMail()
                case .phone:
                    self.activePhoneNumber = value.1
                    self.openPhone()
                case .fax:
                    print("")
                case .website:
                    self.activeURL = value.1
                    self.openURL()
                }
                
                
        }
        
        
        return viewRow
        
    }
    func LongContactViewRow(address: Addresses)-> ViewRow<LongAddressViewFile> {
        
        let viewRow = ViewRow<LongAddressViewFile>() { (row) in
             row.tag = UUID.init().uuidString
            
            }
            .cellSetup { (cell, row) in
                //  Construct the view
                let bundle = Bundle.main
                let nib = UINib(nibName: "AddressLongRow", bundle: bundle)
                
                cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? LongAddressViewFile
                cell.view?.backgroundColor = cell.backgroundColor
                cell.height =  { 105 }
                cell.view?.titleLabel.text = "ADDRESS"
                cell.view?.rowOne.text = address.address1 ?? ""
                cell.view?.rowTwo.text = "\(address.city ?? ""), \(address.state ?? "") \(address.zipCode ?? "")"
                cell.view?.rowThree.text = address.country ?? ""
                self.activeAddress = address
         
                cell.frame.insetBy(dx: 5.0, dy: 5.0)
                cell.selectionStyle = .default
                
            }.onCellSelection() {_,_ in
               
                self.activeAddress = address
                self.openMap()
                
        }
        
        
        return viewRow
        
    }
    func TestAreaRow(value:String)-> TextAreaRow {
        
        let viewRow = TextAreaRow() {
            $0.value = value
            $0.tag = UUID.init().uuidString
            //$0.disabled = true
            $0.textAreaMode = .readOnly
            $0.cellUpdate { cell, row in
                
                cell.textLabel?.sizeToFit()
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.textAlignment = .center // THIS DOES NOT WORK
                cell.height = { 60 }
            }
           
          
        }
        
        
        
        return viewRow
        
    }
    func alert(title: String,body: String) {
    
    let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
}
    
    
}
