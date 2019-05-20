//
//  FormCells.swift
//  
//
//  Created by Engineer 144 on 19/05/2019.
//

import Foundation
import Eureka
import ViewRow


class FormCells: BaseRow {
    
//    let instance = FormCells()
    typealias methodHandler = ()  -> Void
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
    
    
    func TitleHeader(title: String,logoUrl: String) ->Section {
        let section  =  Section() { section in
            var header = HeaderFooterView<HeaderViewFile>(.nibFile(name: "HeaderView", bundle: nil))
            header.onSetupView = { view, _ in
                
                view.logo.setImageWithTransaction(url: logoUrl)
                view.titleLabel.text = title
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
                    
                  //  self.activeURL = value.1
                    cell.view?.accessoryOne.isHidden = true
                    cell.view?.accessoryTwo.image = UIImage(named: "website")
                    
                }
                
                cell.view?.valueLabel.adjustsFontSizeToFitWidth = true
                cell.frame.insetBy(dx: 10.0, dy: 10.0)
                
                
            }.onCellSelection() {_,_ in
                
                
                
                switch(type){
                    
                case .email:
                    print("")
                //    self.activeEmail = value.1
                //    self.openMail()
                case .phone:
                      print("")
                //    self.activePhoneNumber = value.1
                //    self.openPhone()
                case .fax:
                    print("")
                case .website:
                      print("")
                //    self.activeURL = value.1
                //    self.openURL()
                }
                
                
        }
        
        
        return viewRow
        
    }
}
