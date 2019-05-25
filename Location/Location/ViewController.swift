//
//  ViewController.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit
import Moya


class ViewController: UIViewController {

    var categoriesList:[Categories]?
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locations.removeAll()
        
        DataManager().getCategories(completionHandler: { [weak self] (categories, error) in
            print(categories)
            self?.categoriesList = categories
            
            
            DataManager().getLocation(target: APIService.restaurants,completionHandler: { [weak self] (categories, error) in
                self?.locations.append(contentsOf: categories)
            })
            
            DataManager().getLocation(target: APIService.vacationSpot,completionHandler: { [weak self] (categories, error) in
                self?.locations.append(contentsOf: categories)
                
            })
        })
        
        print(locations)
    }


}

