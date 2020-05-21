//
//  DetailResourceViewModel.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

class DetailResourceViewModel: NSObject {
    private var resource: Resource
    
    init(_ resource: Resource) {
        self.resource = resource
    }
}

extension DetailResourceViewModel {
    func numberOfSections () -> Int {
        var sections = 0
        
        if let title = resource.title, !title.isEmpty {
            sections+=1
        }
        
        if let _ = resource.contactInfo {
            sections+=1
        }
        
        
        if let _ = resource.addresses {
            sections+=1
        }
        
        if let _ = resource.socialMedia {
            sections+=1
        }
        
        return sections
    }
    
    func numberRowsOfSection(_ index: Int) -> Int {
        switch index {
        case 0:                // title
            if let _ = resource.title { return 1 }
            return 0
        case 1:                 // contact
            return resource.contactInfo?.details.count ?? 0
        case 2:                 // address
            return resource.addresses?.count ?? 0
        case 3:                 // social media
            return 1
        default:
            return 1
        }
    }
    
    func headerSection(_ index: Int) -> String {
        if numberRowsOfSection(index) > 0 {
            switch index {
           case 0:                  // title
               return "Resource title"
           case 1:                  // address
               return "Contact Information"
           case 2:                  // contact
               return "Address"
           case 3:                  // social media
               return "Note"
           default:
               return ""
           }
        }
        
        return ""
    }
    
    func heightForRow(_ index: Int) -> Int {
        if index == 0 {
           return 40
        }

        if index == 1 {
            return 70
        }

        if index == 2 {
            return 122
        }

        if index == 3 {
            return 66
        }

        return 0
    }
}
