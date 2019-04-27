//
//  ContactInfoCellViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
enum ContactType {
    case phoneNumber ,tollFreeNumber ,faxNumber ,email ,website, none
}
struct ContactInfoDetail {
    var title: String?
    var details: String?
    var type: ContactType = .none
}
struct ContactInfoCellViewViewModel {
    private var _infos:[ContactInfoDetail] = []
    init(contactInfoModel: ContactInfoModel?) {
        guard let contactInfoModel = contactInfoModel else {
            return
        }

        if let emails = contactInfoModel.email{
            let title = "Email Address".uppercased()
            for email in emails {
                let info = ContactInfoDetail(title: title, details: email.isEmpty ? "No data available" :email, type: .email)
                _infos.append(info)
            }
        }
        if let faxNumbers = contactInfoModel.faxNumber{
            let title = "fax number".uppercased()
            for faxNumber in faxNumbers {
                let info = ContactInfoDetail(title: title, details: faxNumber.isEmpty ? "No data available" :faxNumber, type: .faxNumber)
                _infos.append(info)
            }
        }
        if let phoneNumbers = contactInfoModel.phoneNumber{
            let title = "Phone number".uppercased()
            for phoneNumber in phoneNumbers {
                let info = ContactInfoDetail(title: title, details: phoneNumber.isEmpty ? "No data available" :phoneNumber, type: .phoneNumber)
                _infos.append(info)
            }
        }
        if let tollFrees = contactInfoModel.tollFree{
            let title = "toll-free number".uppercased()
            for tollFree in tollFrees {
                let info = ContactInfoDetail(title: title, details: tollFree.isEmpty ? "No data available" :tollFree, type: .tollFreeNumber)
                _infos.append(info)
            }
        }
        if let websites = contactInfoModel.website{
            let title = "Website".uppercased()
            for website in websites {
                let info = ContactInfoDetail(title: title, details: website.isEmpty ? "No data available" :website, type: .website)
                _infos.append(info)
            }
        }
    }
    func getDetail(ForIndex pIndex: Int) -> ContactInfoDetail? {
        if _infos.count > pIndex{
            return _infos[pIndex]
        }
        return nil
    }
    func getNumberOfRecordsCount() -> Int {
        return _infos.count
    }
}


