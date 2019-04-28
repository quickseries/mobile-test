//
//  AddressViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import RealmSwift
import CoreLocation

class AddressViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,OpenMaps {
    
    @IBOutlet weak var tblAddress:UITableView!
    
    var locationManager = CLLocationManager()
    var currentGps:GPS?
    var arrAddress:List<Address>?
    {
        didSet
        {
            tblAddress.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func takeUserToMaps(gps:GPS) {
        
        currentGps = gps
        
        if Common.canOpenTheApp(path: "comgooglemaps://")
        {
            Common.openGoogleMapsApp(gps:gps)
        }
        else
        {
            setupLocation()
        }
    }
    func checkSetup(currentLocation:CLLocation)
    {
        Common.openMapsInWebView(gps: currentGps!, controller: self, currentLocation: currentLocation)
    }
    func setupLocation()
    {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100.0
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if let location = locations.first {
            checkSetup(currentLocation: location)
            
            locationManager.delegate = nil
            locationManager.stopUpdatingLocation()
        }
        
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension AddressViewController
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblAddress.dequeueReusableCell(withIdentifier: "ids_Address") as! AddressCell
        
        guard let addressObj = arrAddress?[indexPath.row]
            else { return UITableViewCell() }
        
        cell.delegate = self
        cell.setupName(addressObj: addressObj)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrAddress?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let addressObj = arrAddress?[indexPath.row]
        else { return 0 }
        
        if addressObj.label.count > 0
        {
            return 150
        }
        
        return 0
    }
}
