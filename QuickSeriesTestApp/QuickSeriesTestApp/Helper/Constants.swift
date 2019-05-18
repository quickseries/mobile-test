//
//  Constants.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

struct Constants {
    
    struct CellIdentifier {
        static let category = "CategoryCollectionViewCellID"
        static let resours = "ResoursTableViewCellID"
        static let resourceDetailRow = "ResourceDetailRowCollectionViewCellID"
        static let resourceInformation = "ResourceInformationCollectionViewCellID"
    }
    
    struct SegueIdentifier {
        static let showCategoryResorceList = "ShowCategoryResorceListViewControllerSegueID"
        static let showResourceDetail = "ShowResourceDetailViewControllerSegueID"
    }
    
    struct Color {
        static let qsRed = UIColor(named: "QSRed")
        static let qsDarkGray = UIColor(named: "QSDarkGray")
        static let qsMiddleGray = UIColor(named: "QSMiddleGray")
        static let qsLightGray = UIColor(named: "QSDarkGray")
    }
    
    struct Number {
        static let largePadding: CGFloat = 16.0
        static let smallPadding: CGFloat = 8.0
        static let resourceDetailRowHieght: CGFloat = 144.0
        static let resourceInformationRowHieght: CGFloat = 88
    }
    
    struct jsonFileName {
        static let categories = "categories"
        static let restaurants = "restaurants"
        static let vacationSpot = "vacation-spot"
    }
    
    struct Message {
        static let noAddress = "NO ADDRESS FOR THIS RESIURCE"
        static let noContact = "NO CONTACT FOR THIS RESIURCE"
        static let noPhoneNumber = "NO PHONE NUMBER FOR THIS RESIURCE"
        static let noWebsite = "NO WEBSITE  FOR THIS RESIURCE"
        static let noEmail = "NO EMAIL  FOR THIS RESIURCE"
        static let noDescription = "No Description Avalable"
    }
    
    struct NibName {
        static let resourceInformationCell = "ResourceInformationCollectionViewCell"
    }
    
    struct ImageName {
        static let locationIcon = "LocationIcon"
        static let mailIcon = "MailIcon"
        static let websiteIcon = "WebsiteIcon"
        static let callIcon = "CallIcon"
    }
    
}
