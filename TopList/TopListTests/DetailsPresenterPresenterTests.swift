//
//  DetailsPresenterPresenterTests.swift
//  TopListTests
//
//  Created by Rathish Kannan on 5/20/19.
//  Copyright © 2019 Rathish Kannan. All rights reserved.
//

@testable import TopList
import XCTest

class DetailsPresenterPresenterTests: XCTestCase
{
  // MARK: - Subject under test
  
  var sut: DetailsPresenter!
  
  // MARK: - Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setUpDetailsPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setUpDetailsPresenter()
  {
    sut = DetailsPresenter()
  }
  
  // MARK: - Test doubles
  
  class DetailsDisplayLogicSpy: DetailsDisplayLogic
  {
    // MARK: Method call expectations
    
    var displayFetchedDetailsCalled = false
    
    // MARK: Argument expectations
    
    var viewModel: Details.FetchDetails.ViewModel!
    
    // MARK: Spied methods
    
    func displayDetails(viewModel: Details.FetchDetails.ViewModel)
    {
      displayFetchedDetailsCalled = true
      self.viewModel = viewModel
    }
  }
  
  // MARK: - Tests
  
  func testPresentFetchedDetailsShouldFormatFetchedDetailsForDisplay()
  {
    // Given
    let detailsDisplayLogicSpy = DetailsDisplayLogicSpy()
    sut.viewController = detailsDisplayLogicSpy
    
    // When
    let details = Array<DetailLists>()
    let response = Details.FetchDetails.Response(details: details)
    sut.presentDetails(response: response)
    
    // Then
    let displayeDetails = detailsDisplayLogicSpy.viewModel.details
    for displayedDetail in displayeDetails {
      XCTAssertEqual(displayedDetail.sectionTitle, "details", "Presenting fetched detailss should properly format")
      XCTAssertEqual(displayedDetail.date, "6/29/19", "Presenting fetched  should properly format details date")
      XCTAssertEqual(displayedDetail.overView, "QuickSeries", "Presenting fetched  should properly format overView")
      XCTAssertEqual(displayedDetail.name, "Quassao", "Presenting fetched  should properly format name")
    }
  }
  
  func testPresentFetchedDetailsShouldAskViewControllerToDisplayFetchedDetails()
  {
    // Given
    let detailsDisplayLogicSpy = DetailsDisplayLogicSpy()
    sut.viewController = detailsDisplayLogicSpy
    
    // When
    let details = Array<DetailLists>()
    let response = Details.FetchDetails.Response(details: details)
    sut.presentDetails(response: response)

    // Then
    XCTAssert(detailsDisplayLogicSpy.displayFetchedDetailsCalled, "Presenting fetched details should ask view controller to display them")
  }
}
