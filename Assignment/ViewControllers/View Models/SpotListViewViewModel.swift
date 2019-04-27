//
//  SpotListViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

class SpotListViewViewModel {
    
    private let dataStore: DataStore
    private let disposeBag = DisposeBag()
    
    init(fileName: Driver<String>, dataStore: DataStore) {
        self.dataStore = dataStore
        fileName
            .drive(onNext: { [weak self] (fileName) in
                print(fileName)
                self?.fetchSpots(fileName: fileName)
            }).disposed(by: disposeBag)
    }
    private let _spots = BehaviorRelay<[SpotModel]>(value: [])
    private let _isFetching = BehaviorRelay<Bool>(value: false)
    private let _error = BehaviorRelay<String?>(value: nil)
    
    var isFetching: Driver<Bool> {
        return _isFetching.asDriver()
    }
    
    var spots: Driver<[SpotModel]> {
        return _spots.asDriver()
    }
    
    var error: Driver<String?> {
        return _error.asDriver()
    }
    
    var hasError: Bool {
        return _error.value != nil
    }
    
    var numberOfSpots: Int {
        return _spots.value.count
    }
    
    func viewModelForSpot(at index: Int) -> SpotViewViewModel? {
        guard index < _spots.value.count else {
            return nil
        }
        return SpotViewViewModel(spot: _spots.value[index])
    }
    
    func resourceDetailViewViewModelForSpot(at index: Int) -> ResourceDetailViewViewModel? {
        guard index < _spots.value.count else {
            return nil
        }
   return ResourceDetailViewViewModel(spotModel: _spots.value[index])
    }
    var isAsending = false
    func fetchSortedSpotsFromDB(categoryEID:String) {
        isAsending = !isAsending
        DataManager.sharedInstance.getSpotsDataFromDB(catEID:categoryEID, ascending:isAsending, successHandler: {[weak self] (spotsList) in
            print(spotsList)
            self?._isFetching.accept(false)
            self?._spots.accept(Array(spotsList))
            
        })
    }
    private func fetchSpots(fileName: String) {
        self._spots.accept([])
        self._isFetching.accept(true)
        self._error.accept(nil)
        
        dataStore.fetchSpots(fromFile: fileName, successHandler: {[weak self] (spotsArr) in
            print(spotsArr)
            self?._isFetching.accept(false)
            self?._spots.accept(spotsArr)
        }) {[weak self](error) in
            print(error)
            self?._isFetching.accept(false)
            self?._error.accept(error.localizedDescription)
        }
    }
    
}

