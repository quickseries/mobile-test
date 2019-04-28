//
//  Common.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import CoreLocation

class Common: NSObject {

    class func canOpenTheApp(path:String) -> Bool
    {
        guard let url = URL(string: path)
        else { return false }
        
        return UIApplication.shared.canOpenURL(url)
    }
    class func openMapsInWebView(gps:GPS,controller:UIViewController,currentLocation:CLLocation)
    {
        let url = "https://maps.google.com/?saddr=\(gps.latitude),\(gps.longitude)&daddr=\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)&hl=en"
        openWebView(controller: controller,url: url)
    }
    class func makeCall(number:String,controller:UIViewController)
    {
        guard let number = URL(string: "telprompt://" + number)
        else {
            sendAlert(title: "Error", msg: "Device does not support this feature", viewController: controller)
            return
        }
        
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    class func openWebView(controller:UIViewController,url:String)
    {
        let webView:WebViewController = controller.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
        webView.url = url
        controller.navigationController?.pushViewController(webView, animated: true)
    }
    class func openGoogleMapsApp(gps:GPS)
    {
        let url = String(format: "comgooglemaps://?saddr=&daddr=\(gps.latitude),\(gps.latitude)&directionsmode=driving")
        UIApplication.shared.openURL(URL(string:url)!)
    }

    class func sendAlert(title:String,msg:String,viewController:UIViewController)
    {
        
        let actionSheetController = UIAlertController(title: title, message:msg, preferredStyle: .alert)
        
        let cancelActionButton = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelActionButton)
        viewController  .present(actionSheetController, animated: true, completion: nil)
    }

}
