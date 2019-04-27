//
//  BusinessHourCellViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
struct BusinessHoursDetail {
    var title: String?
    var timing: String {
        guard let workingHours = hours,
            let fromHours = workingHours.from,
            let toHours = workingHours.to else {
                return "closed".uppercased()
        }
        return "\(fromHours) - \(toHours)"
    }
    let hours:Hours?
    
}

struct BusinessHoursCellViewViewModel {
    enum kday: Int {
        case Sunday = 0, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
    
    let allDays: [String?] = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

    private var _businessHoursDetails:[BusinessHoursDetail] = []
    init(bizHours: BizHoursModel?) {
        guard let bizHours = bizHours else {
            return
        }
        
        for i in 0 ..< 7{
            switch(i)
            {
            case kday.Sunday.rawValue:
            let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.sunday)
            _businessHoursDetails.append(detail)
            break
            case kday.Monday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.monday)
                _businessHoursDetails.append(detail)
                break
            case kday.Tuesday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.tuesday)
                _businessHoursDetails.append(detail)
                break
            case kday.Wednesday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.wednesday)
                _businessHoursDetails.append(detail)
                break
            case kday.Thursday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.thursday)
                _businessHoursDetails.append(detail)
                break
            case kday.Friday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.friday)
                _businessHoursDetails.append(detail)
                break
            case kday.Saturday.rawValue:
                let detail = BusinessHoursDetail(title: allDays[i], hours: bizHours.saturday)
                _businessHoursDetails.append(detail)
                break
           
            default:
                break
            }
        }
    }
    func getDetail(ForIndex pIndex: Int) -> BusinessHoursDetail? {
        if _businessHoursDetails.count > pIndex{
            return _businessHoursDetails[pIndex]
        }
        return nil
    }
    func getNumberOfRecordsCount() -> Int {
        return _businessHoursDetails.count
    }
}


