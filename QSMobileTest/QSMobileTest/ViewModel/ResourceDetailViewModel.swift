//
//  ResourceDetailViewModel.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 21/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Former

class ResourceDetailViewModel {
    
    private let disposable = DisposeBag()
    
    var resource: Resource?
    var former: Former?

    init(resource: Resource?, former: Former?) {
        self.resource = resource
        self.former = former
    }
    
    
    public func configureCell () {
        
        // Create Headers
        
        let createSpaceHeader: (() -> ViewFormer) = {
            return CustomViewFormer<FormHeaderFooterView>()
                .configure {
                    $0.viewHeight = 30
            }
        }
        let createHeader: ((String) -> ViewFormer) = { text in
            return LabelViewFormer<FormLabelHeaderView>()
                .configure {
                    $0.text = text
                    $0.viewHeight = 44
            }
        }
        
        if let description = self.resource?.resourceDescription{
            
            // resource description goes here
            let resourceDescription = CustomRowFormer<DynamicHeightCell>(instantiateType: .Nib(nibName: "DynamicHeightCell")) {
                $0.title = ""
                $0.body = description.stripOutHtml()
                }.configure {
                    $0.rowHeight = UITableView.automaticDimension
            }
            
            let resourceDescriptionHeightSection = SectionFormer(rowFormer: resourceDescription)
                .set(headerViewFormer: createSpaceHeader())
            
            former?.append(sectionFormer: resourceDescriptionHeightSection)
        }
        
        
        var contactSectionArray: [CustomRowFormer<ProfileLabelCell>] = []
        var addressSectionArray: [CustomRowFormer<ProfileLabelCell>] = []
        var businessHourSectionArray: [CustomRowFormer<BusinessLabelCell>] = []

        if let listPhone = resource?.contactInfo?.phoneNumber {
            
            for phone in listPhone{
                let resourceContactPhone = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "PHONE NUMBER"
                    $0.displayLabel?.text = phone
                    }.configure {
                        $0.rowHeight = 61
                }
                contactSectionArray.append(resourceContactPhone);
            }
            
        }
        
        if let listToll = resource?.contactInfo?.tollFree {
            
            for phone in listToll{
                let resourceContactPhone = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "TOLL-FREE NUMBER"
                    $0.displayLabel?.text = phone
                    }.configure {
                        $0.rowHeight = 61
                }
                contactSectionArray.append(resourceContactPhone);
            }
            
        }
        
        if let listOfFax = resource?.contactInfo?.faxNumber {
            for fax in listOfFax{
                let resourceContactPhone = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "FAX NUMBER"
                    $0.displayLabel?.text = fax
                    }.configure {
                        $0.rowHeight = 61
                }
                contactSectionArray.append(resourceContactPhone);
            }
        }
        

        if let emails = resource?.contactInfo?.email {
            
            for email in emails{
                let resourceContactEmail = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "EMAIL ADDRESS"
                    $0.displayLabel?.text = email
                    }.configure {
                        $0.rowHeight = 61
                }
                contactSectionArray.append(resourceContactEmail);
            }
        }
        
        
        if let websites = resource?.contactInfo?.website {
            
            for website in websites{
                
                let resourceContactWebSite = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "WEBSITE"
                    $0.displayLabel?.text = website
                    }.configure {
                        $0.rowHeight = 61
                }
                
                contactSectionArray.append(resourceContactWebSite);
            }
        }

        if let addresses = resource?.addresses {
            
            for address in addresses {
                
                let resourceContactAddress1 = CustomRowFormer<ProfileLabelCell>(instantiateType: .Nib(nibName: "ProfileLabelCell")) {
                    $0.titleLabel.text = "ADDRESS"
                    $0.displayLabel?.text = address.addressToString()
                    }.configure {
                        $0.rowHeight = UITableView.automaticDimension
                }
                
                addressSectionArray.append(resourceContactAddress1)
            }
            
        }
        
        
        if let businessHours = resource?.bizHours{
            
            let mondayHour = [businessHours.monday?.from,businessHours.monday?.to].compactMap { $0 }.joined(separator: "-")
            let monday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "MONDAY"
                $0.displayLabel?.text = (mondayHour.count > 0) ? mondayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            let tuesdayHour = [businessHours.tuesday?.from,businessHours.tuesday?.to].compactMap { $0 }.joined(separator: "-")
            let tuesday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "TUESDAY"
                $0.displayLabel?.text = (tuesdayHour.count > 0) ? tuesdayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            let wednesdayHour = [businessHours.wednesday?.from,businessHours.wednesday?.to].compactMap { $0 }.joined(separator: "-")
            let wednesday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "WEDNESDAY"
                $0.displayLabel?.text = (wednesdayHour.count > 0) ? wednesdayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            let thursdayHour = [businessHours.thursday?.from,businessHours.thursday?.to].compactMap { $0 }.joined(separator: "-")
            let thursday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "THURSDAY"
                $0.displayLabel?.text = (thursdayHour.count > 0) ? thursdayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            let fridayHour = [businessHours.friday?.from,businessHours.friday?.to].compactMap { $0 }.joined(separator: "-")
            let friday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "FRIDAY"
                $0.displayLabel?.text = (fridayHour.count > 0) ? fridayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            let sundayHour = [businessHours.sunday?.from,businessHours.sunday?.to].compactMap { $0 }.joined(separator: "-")
            let sunday = CustomRowFormer<BusinessLabelCell>(instantiateType: .Nib(nibName: "BusinessLabelCell")) {
                $0.titleLabel.text = "SUNDAY"
                $0.displayLabel?.text = (sundayHour.count > 0) ? sundayHour : "CLOSED"
                }.configure {
                    $0.rowHeight = 61
            }
            
            businessHourSectionArray.append(monday)
            businessHourSectionArray.append(tuesday)
            businessHourSectionArray.append(wednesday)
            businessHourSectionArray.append(thursday)
            businessHourSectionArray.append(friday)
            businessHourSectionArray.append(sunday)

        }

        // Create Section
        
        let introductionSection = SectionFormer(rowFormers: contactSectionArray)
            .set(headerViewFormer: createHeader("CONTACT INFORMATION"))

        
        let addressSection = SectionFormer(rowFormers: addressSectionArray)
            .set(headerViewFormer: createHeader("ADDRESS"))

        
        let businessSection = SectionFormer(rowFormers: businessHourSectionArray)
            .set(headerViewFormer: createHeader("BUSINESS HOURS"))
        
        self.former?.append(sectionFormer:introductionSection,addressSection,businessSection)
        
    }
}
