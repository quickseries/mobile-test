//
//  CategoryViewModel.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CategoryViewModel {
    
    public enum categoryError {
        case internetError(String)
        case serverMessage(String)
    }
    
    public let categories : PublishSubject<[Category]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<categoryError> = PublishSubject()

    private let disposable = DisposeBag()


    public func requestData(){

        self.loading.onNext(true)
        APIManager.requestData(url: "quickseries/mobile-test/master/data/categories.json", method: .get, parameters: nil, completion: { (result) in
            self.loading.onNext(false)
            switch result {
            case .success(let returnJson) :                
                let categories = returnJson.arrayValue.compactMap { try? Category(data: $0.rawData()) }
                self.categories.onNext(categories)
                
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
