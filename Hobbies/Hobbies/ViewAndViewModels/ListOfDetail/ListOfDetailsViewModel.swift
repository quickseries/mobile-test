//
//  ListAndDetailViewModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit
import RxSwift

class ListOfDetailsViewModel: NSObject
{
    public let loading: PublishSubject<Bool> = PublishSubject()
    private var viewController: ListViewController
    var category: CategoryModel!
    var type: HobbiesTypes! {
        didSet {
            self.requestData()
        }
    }
     init(viewController: ListViewController) {
        self.loading.onNext(true)
        self.viewController = viewController
    }
    
    func requestData()
    {
        let service = DetailServices()
        service.getAListOf(self.type) { (dataList, error) in
            self.loading.onNext(false)
            guard error == nil else {
                MessageUtility.show(error: error!)
                return
            }
            DispatchQueue.main.async {
                self.viewController.listData = dataList!
                self.viewController.tableView.reloadData()
            }
        }
    }
}

