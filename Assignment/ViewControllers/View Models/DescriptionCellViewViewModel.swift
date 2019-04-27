//
//  DescriptionCellViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation

struct DescriptionCellViewViewModel {
    private var _title: String?
    private var _description: NSAttributedString?
    private var _photoURL: URL?
    init(spotModel: SpotModel?) {
        
            guard let spotModel = spotModel else {
                return
            }
            _title = spotModel.title
        
            let description = spotModel.description1 ?? ""
            let data = description.data(using: String.Encoding.unicode)! // mind "!"
            let attrStr = (try? NSAttributedString( // do catch
                data: data,
                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil))
            _description = attrStr
        
        
    
            if let urlStr = spotModel.photo{
                _photoURL = URL(string: urlStr)
            }
        
    }
    
    var title: String? {
        return _title
    }
    
    var description: NSAttributedString? {
        return _description
    }
   
    var photoURL: URL? {
        return _photoURL
    }
    
}
