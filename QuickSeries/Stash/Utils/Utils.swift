//
//  Utils.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import ObjectMapper

class Utils: NSObject {

    class func getDataForJson(filePath:String,extensionName:String) -> JsonFetch
    {
        var jsonFetchObj = JsonFetch()
        
        // Optional for the url of file
        guard let filePath = Bundle.main.url(forResource: filePath, withExtension: extensionName)
        else{ return jsonFetchObj }
        
        do
        {
            // fetching raw data with try block to handle error
            let rawData = try Data(contentsOf: filePath)
            guard let arrCategories = try JSONSerialization.jsonObject(with: rawData, options: []) as? NSArray else {
                return jsonFetchObj
            }
            
            jsonFetchObj.dataArray = arrCategories
            jsonFetchObj.success = true

            return jsonFetchObj
        }
        catch
        {
            return jsonFetchObj
        }
    }    
}
