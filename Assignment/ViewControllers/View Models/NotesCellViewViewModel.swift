//
//  NotesCellViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NotesCellViewViewModel {
    private var _notes:[String] = []
    init(freeTexts: [JSON]?) {
        guard let freeTexts = freeTexts else {
            return
        }
        
        for freeText in freeTexts{
//            _notes.append(freeText)
            let valuesArray = Array(freeText.dictionaryValue.values)
            for jsonValue in valuesArray{
                if let noteStr = jsonValue.string, jsonValue.type == .string{
                    _notes.append(noteStr)
                }
            }
        }
    }
    func getNote(ForIndex pIndex: Int) -> String? {
        if _notes.count > pIndex{
            return _notes[pIndex]
        }
        return nil
    }
    func getNumberOfRecordsCount() -> Int {
        return _notes.count
    }
}


