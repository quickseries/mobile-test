//
//  VacationSpotDetailViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-19.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class VacationSpotDetailViewModel: ViewModelType {
  
  private let vacationItem: VacationSpotItemViewModel
  
  init(vacationItem: VacationSpotItemViewModel) {
    self.vacationItem = vacationItem
  }
  func transform(input: VacationSpotDetailViewModel.Input) -> VacationSpotDetailViewModel.Output {
    let restaurantItem = VacationSpotDetailItemViewModel(with: self.vacationItem)
    let addressHeight = CGFloat(restaurantItem.addresses.count * 130)
    let contactInfoHeight = CGFloat(restaurantItem.contactInfos().count * 80)
    let socialMediaHeight: CGFloat = restaurantItem.socialMediaItems().count > 0 ? 80.0 : 0.0

    return Output(title: Driver.just("  \(restaurantItem.title)"), description: Driver.just(restaurantItem.description), contactInfoItems: Driver.just(restaurantItem.contactInfos()), contactInfoHeight: contactInfoHeight, adressItems: Driver.just(restaurantItem.addresses), addressHeight: addressHeight, socialMediaItems: Driver.just(restaurantItem.socialMediaItems()), socialMediaHeight: socialMediaHeight, businessOur: Driver.just(restaurantItem.businessHours))
  }
}
extension VacationSpotDetailViewModel {
  struct Input {
    
  }
  
  struct Output {
    let title: Driver<String>
    let description: Driver<NSAttributedString>
    let contactInfoItems: Driver<[ContactInfoItem]>
    let contactInfoHeight: CGFloat
    let adressItems: Driver<[Adress]>
    let addressHeight: CGFloat
    let socialMediaItems: Driver<[SocialMediaItem]>
    let socialMediaHeight: CGFloat
    let businessOur: Driver<[BusinessWeekItem]>
  }
}
