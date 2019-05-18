//
//  QuickItemDetailVC.swift
//  QuickSeries
//
//  Created by Engineer 144 on 18/05/2019.
//

import UIKit
import Eureka
import ViewRow

class QuickItemDetailVC: FormViewController {
    
    
     var activePhoneNumber = ""
    
    var itemDetails : CategoryItemViewModel!
    
    let phoneCallTouchGuesture = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openPhone))
    let emailTouchGuesture = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openMail))
    let webPageTouchGuesture = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openURL))
    let mapTouchGuesture = UITapGestureRecognizer(target: self, action: #selector(QuickItemDetailVC.openMap))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         //TODO ADD KVO's
        buildViews()
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




///OBJC ACTION METHODS FOR UIVIEWS

extension QuickItemDetailVC {
    @objc func openPhone()
    {
        self.activePhoneNumber.makeACall()
        print("i was called \(self.activePhoneNumber) to make a callc")
    }
    
    @objc func openURL()
    {
        
        print("i was called ")
    }
    
    @objc func openMail()
    {
        
        print("i was called ")
    }
    
    @objc func openMap()
    {
        
        print("i was called ")
    }
}

////Eureka Cells extension for class
extension QuickItemDetailVC {
    
    
    
    func CustomLabelRow (key: String,value: String)->LabelRow{
        
      let view = LabelRow () {
            $0.title = key
            $0.value = value
            }
            .onCellSelection { cell, row in
                //  row.title = (row.title ?? "") + " 🇺🇾 "
                // row.reload() // or row.updateCell()
        }
        
        return view
    }
    func SocialViewRow(address: SocialMedia)-> ViewRow<SocialMediaViewFile> {
    
    let viewRow = ViewRow<SocialMediaViewFile>() { (row) in
        
        
        }
        .cellSetup { (cell, row) in
            //  Construct the view
            let bundle = Bundle.main
            let nib = UINib(nibName: "SocialMediaView", bundle: bundle)
            
            cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? SocialMediaViewFile
            cell.view?.backgroundColor = cell.backgroundColor
            cell.height =  { 50 }
            print("LINK \(address.facebook?[0] ?? "")")
            
            
            
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
                
                switch(type){
                    
                case .email:
                    
                    cell.view?.accessoryOne.isHidden = true
                    cell.view?.accessoryTwo.image =  UIImage(named: "email")
                    cell.view?.accessoryTwo.addGestureRecognizer(self.emailTouchGuesture)
                    
                    
                
                case .phone:
                    cell.view?.accessoryOne.image = UIImage(named: "sms")
                    cell.view?.accessoryTwo.image =  UIImage(named: "phone")
                    self.activePhoneNumber = value.1
                    cell.view?.accessoryTwo.addGestureRecognizer(self.phoneCallTouchGuesture)
                    
                  
                  
                   
                case .fax:
                     cell.view?.accessoryOne.isHidden = true
                     cell.view?.accessoryTwo.isHidden = true
                    
                case .website:
                    cell.view?.accessoryOne.isHidden = true
                    cell.view?.accessoryTwo.image = UIImage(named: "website")
                    cell.view?.accessoryTwo.addGestureRecognizer(self.webPageTouchGuesture)
                }
                
                cell.view?.valueLabel.adjustsFontSizeToFitWidth = true
                cell.frame.insetBy(dx: 10.0, dy: 10.0)
                cell.selectionStyle = .none
                
            }.onCellSelection() {_,_ in
                
                
                
                
        }
        
        
        return viewRow
        
    }
    func LongContactViewRow(address: Addresses)-> ViewRow<LongAddressViewFile> {
        
        let viewRow = ViewRow<LongAddressViewFile>("") { (row) in
            
            
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
                cell.view?.iconImage.addGestureRecognizer(self.mapTouchGuesture)
                cell.frame.insetBy(dx: 5.0, dy: 5.0)
                cell.selectionStyle = .none
                
            }.onCellSelection() {_,_ in
               
                
        }
        
        
        return viewRow
        
    }
    func TestAreaRow(value:String)-> TextAreaRow {
        
        let viewRow = TextAreaRow() {
            $0.value = value
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
    
    
    
}
