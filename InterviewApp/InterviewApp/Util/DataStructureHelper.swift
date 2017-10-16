//
//  DataStructureHelper.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-14.
//  Copyright © 2017 none. All rights reserved.
//

import Foundation

enum Contact : String {
    case phoneNumber
    case tollFree
    case faxNumber
    case email
    case website
    
    static func handleAction(rawValue:String, value:String) {
        if let contact = Contact(rawValue: rawValue) {
            switch contact {
            case phoneNumber:
                break
            case tollFree:
                break
            case faxNumber:
                break
            case email:
                break
            case website:
                break
            }
        }
    }
    
    static func getIconString(rawValue: String) -> String {
        if let contact = Contact(rawValue: rawValue) {
            switch contact {
            case .phoneNumber:
                return "i"
            case .tollFree:
                return "i"
            case .faxNumber:
                return "k"
            case .email:
                return "e"
            case .website:
                return "g"
            }
        }
        return ""
    }
    
}

enum WeekDay : String {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    static func daysArray() -> [WeekDay] {
        return [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
    }
    
    func display() -> String {
        return self.rawValue.localized
    }
}

enum SocialMedia : String {
    case facebook
    case twitter
    case youtubeChannel
    
    
    static func daysArray() -> [SocialMedia] {
        return [.facebook, .twitter, .youtubeChannel]
    }
    
}
