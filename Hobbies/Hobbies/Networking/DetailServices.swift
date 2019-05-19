//
//  DetailServices.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit
enum HobbiesTypes: String
{
    case restaurants = "restaurants.json"
    case vacations = "vacation-spot.json"
    case categories = "categories.json"
}
internal class DetailServices: BaseNetworkingServices
{
    //results can be either an array of ResturantModel or VacationModel
    func getAListOf(_ hobbieType: HobbiesTypes,completionHandler: @escaping (_ result: Array<ListModelProtocol>?, _ error:AppError?) -> Void)
    {
        
        self.request(endpoint: hobbieType.rawValue, method: .get) { (result) in
            switch result{
            case .success(let objects):
                
                switch hobbieType{
                case .restaurants:
                    if let restaurantArray = objects as? Array<Dictionary<String, Any>> {
                        var restaurants = Array<RestaurantModel>()
                        for restaurantObject in restaurantArray {
                            if let newRestaurant = RestaurantModel(JSON: restaurantObject) {
                                restaurants.append(newRestaurant)
                            }
                        }
                        completionHandler(restaurants, nil)
                        return
                    }

                case .vacations:
                    if let vacationArray = objects as? Array<Dictionary<String, Any>> {
                        var vacations = Array<VacationModel>()
                        for vacationObject in vacationArray {
                            if let newVacation = VacationModel(JSON: vacationObject) {
                                vacations.append(newVacation)
                            }
                        }
                        completionHandler(vacations, nil)
                        return
                    }
                default: break
                }
                
                completionHandler(nil, AppError.createNetworkingError(WithType: .jsonParsing))
                return
            case .failure(let error):
                completionHandler(nil, error as? AppError)
                return
            }
        }
    }
}
