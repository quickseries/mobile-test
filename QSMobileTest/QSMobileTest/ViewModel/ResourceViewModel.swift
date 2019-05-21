//
//  ResourceViewModel.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ResourceViewModel {
    
    public enum resourceError {
        case internetError(String)
        case serverMessage(String)
    }
    
    public let resources : PublishSubject<[Resource]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<resourceError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    var category: Category?
    
    init(category: Category?) {
        self.category = category
    }
    
    public func requestData(){
        var endpoint = ""
        if self.category?.slug == CategoryType.restaurants.rawValue {
            endpoint = "quickseries/mobile-test/master/data/restaurants.json"
        }else{
            endpoint = "quickseries/mobile-test/master/data/vacation-spot.json"
        }
        
        self.loading.onNext(true)
        APIManager.requestData(url: endpoint, method: .get, parameters: nil, completion: { (result) in
            self.loading.onNext(false)
            switch result {
            case .success(let returnJson) :
                let resources = returnJson.array?.compactMap { try? Resource(data: $0.rawData()) }
                self.resources.onNext(resources!)
                
            case .failure(let failure) :
                switch failure {
                case .connectionError:
                    self.error.onNext(.internetError("Check your Internet connection."))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"].stringValue))
                default:
                    self.error.onNext(.serverMessage("Unknown Error"))
                }
            }
        })
        
    }
}
