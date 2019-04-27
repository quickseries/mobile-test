//
//  AddressCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import MapKit

class AddressCell: UITableViewCell {
    var containerViewController : UIViewController?
    var addressDetail: AddressDetail?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBAction func rightButton1Action(_ sender: Any) {
        self.openMapForLocation()
    }
    @IBOutlet weak var rightButton1: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(pContainerViewController : UIViewController?, pViewModel: AddressCellViewViewModel, pIndex: Int) {
        self.containerViewController = pContainerViewController
        self.addressDetail = pViewModel.getDetail(ForIndex: pIndex)
        guard let addressDetail = self.addressDetail else{
            return
        }
        self.titleLabel.text = addressDetail.title
        self.addressLabel.text = addressDetail.formatedAddress
        self.rightButton1.isHidden = (addressDetail.location == nil)
    }
    
    private func openMapForLocation() {
        guard let addressDetail = self.addressDetail, let location = addressDetail.location else {
            return
        }
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(addressDetail.label ?? "")"
        mapItem.openInMaps(launchOptions: options)
        
    }
}
