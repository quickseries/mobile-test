//
//  StubGenerator.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation

class StubGenerator {
    private func getFileContentsAsJson(fileUrl: URL) -> Data? {
        if let data = try? Data(contentsOf: fileUrl) {
            return data
        }
        return nil
    }
    
    func getCategoriesData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        
        if let fileUrl = testBundle.url(forResource: "categories", withExtension: "json") {
            if let data = getFileContentsAsJson(fileUrl: fileUrl) {
                return data
            }
        }
        return nil
    }
    
    func getRestaurantsData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        
        if let fileUrl = testBundle.url(forResource: "restaurants", withExtension: "json") {
            if let data = getFileContentsAsJson(fileUrl: fileUrl) {
                return data
            }
        }
        return nil
    }
    
    func getVacationSpotData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        
        if let fileUrl = testBundle.url(forResource: "vacation-spot", withExtension: "json") {
            if let data = getFileContentsAsJson(fileUrl: fileUrl) {
                return data
            }
        }
        return nil
    }
}
