//
//  SpotViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation

import Foundation

struct SpotViewViewModel {
    
    private var spot: SpotModel
    
    private static let dateFormatter: DateFormatter = {
        $0.dateStyle = .medium
        $0.timeStyle = .none
        return $0
    }(DateFormatter())
    
    init(spot: SpotModel) {
        self.spot = spot
    }
    
    var title: String {
        return spot.title ?? ""
    }
    
    var description: NSAttributedString? {
        let description = spot.description1 ?? ""
        let data = description.data(using: String.Encoding.unicode)! // mind "!"
        let attrStr = (try? NSAttributedString( // do catch
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil))
        return attrStr
    }

}
