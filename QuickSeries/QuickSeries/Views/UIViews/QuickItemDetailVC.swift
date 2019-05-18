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
    
    var itemDetails : CategoryItemViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buildViews()
    }
    
    
    

    func buildViews()  {
      
        
        form +++
            TitleHeader()
        
        self.form +++
            
            
            
            TestAreaRow(cluster: ("String", "String"))
        
        
        
        +++ Section("CONTACT INFORMATION")
       
        
       
        for item in itemDetails.categoryItem.contactInfo?.phoneNumber ?? [] {
            
            self.form.last?.append(ShortContactViewRow(cluster: ("PHONE NUMBER",item )))
            
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.tollFree ?? [] {
            
            self.form.last?.append(ShortContactViewRow(cluster: ("TOLL-FREE NUMBER",item )))
            
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.faxNumber ?? [] {
            
            self.form.last?.append(ShortContactViewRow(cluster: ("FAX NUMBER",item )))
            
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.email ?? [] {
            
            self.form.last?.append(ShortContactViewRow(cluster: ("EMAIL ADDRESS",item )))
            
        }
        
        
        for item in itemDetails.categoryItem.contactInfo?.website ?? [] {
            
            self.form.last?.append(ShortContactViewRow(cluster: ("WEBSITE",item )))
            
        }
        
       self.form +++ Section("ADDRESSS")
        
        
        for item in itemDetails.categoryItem.addresses ?? [] {
            
            
            self.form.last?.append(LongContactViewRow(address: item))
        }
        
       // self.form.last += +++Section("ADDRESS")
        
    }
   
    
    
    
    func TitleHeader() ->Section {
        let section  =  Section() { section in
           var header = HeaderFooterView<HeaderViewFile>(.nibFile(name: "HeaderView", bundle: nil))
            header.onSetupView = { view, _ in
                
                view.logo.setImage(url: self.itemDetails.categoryItem.photo ?? "")
                view.titleLabel.text = self.itemDetails.categoryItem.title ?? ""
            }
            section.header = header
        }
        
        
        return section
        
    }
    func ShortContactViewRow(cluster: (String,String))-> ViewRow<ContactViewCellFile> {
    
    let viewRow = ViewRow<ContactViewCellFile>(cluster.0) { (row) in
        
        
        }
        .cellSetup { (cell, row) in
            //  Construct the view
            let bundle = Bundle.main
            let nib = UINib(nibName: "ContactViewCell", bundle: bundle)
            
            cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? ContactViewCellFile
            cell.view?.backgroundColor = cell.backgroundColor
            cell.height =  { 50 }
            cell.view?.titleLabel.text = cluster.0
            cell.view?.valueLabel.text = cluster.1
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
                cell.frame.insetBy(dx: 5.0, dy: 5.0)
                cell.selectionStyle = .none
                
            }.onCellSelection() {_,_ in
                /**
                 
                 {
                 "label": "Quesada",
                 "address1": "3343 Boul des Sources",
                 "city": "Montreal",
                 "zipCode": "H9B1Z8",
                 "state": "QC",
                 "country": "Canada"
                 }
                 */
                
                
                
        }
        
        
        return viewRow
        
    }
    func TestAreaRow(cluster: (String,String))-> TextAreaRow {
        
    let viewRow = TextAreaRow() {
    $0.value = self.itemDetails.categoryItem.description?.htmlToString ?? ""
    $0.textAreaMode = .readOnly
    $0.cell.textView.textColor = UIColor.lightGray
        $0.textAreaHeight =  .fixed(cellHeight: 10)
    }
    
        
        
        return viewRow
        
    }
    
    @IBAction func dismissMe(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
