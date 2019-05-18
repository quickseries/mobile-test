//
//  RestaurantDetailViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class RestaurantDetailViewModel: ViewModelType {
  
  private let restaurantItem: RestaurantItemViewModel

  init(restaurantItem: RestaurantItemViewModel) {
    self.restaurantItem = restaurantItem
  }
  func transform(input: RestaurantDetailViewModel.Input) -> RestaurantDetailViewModel.Output {
    let restaurantItem = RestaurantDetailItemViewModel(with: self.restaurantItem)
    let addressHeight = CGFloat(restaurantItem.addresses.count * 130)
    let contactInfoHeight = CGFloat(restaurantItem.contactInfos().count * 80)
    let socialMediaHeight: CGFloat = restaurantItem.socialMediaItems().count > 0 ? 80.0 : 0.0

    return Output(title: Driver.just("  \(restaurantItem.title)"), description: Driver.just(restaurantItem.description), contactInfoItems: Driver.just(restaurantItem.contactInfos()), contactInfoHeight: contactInfoHeight, adressItems: Driver.just(restaurantItem.addresses), addressHeight: addressHeight, socialMediaItems: Driver.just(restaurantItem.socialMediaItems()), socialMediaHeight: socialMediaHeight, businessOur: Driver.just(restaurantItem.businessHours))
  }
}
extension RestaurantDetailViewModel {
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
