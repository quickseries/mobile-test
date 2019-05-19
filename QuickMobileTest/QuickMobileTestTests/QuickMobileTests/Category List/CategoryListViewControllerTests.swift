//
//  CategoryListViewControllerTests.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import XCTest
@testable import QuickMobileTest

class CategoryListViewControllerTests: BaseTestCase {
    
    var controller: CategoryListViewController!
    var presenter: MockCategoryListPresenter!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        window = nil
        controller = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func configure() {
        window = UIWindow()
        controller =  ViewUtility.getCategoryListViewController()
    }
    
    private func loadView() {
        window.addSubview(controller.view)
        RunLoop.current.run(until: Date())
    }
    
    func testSetup() {
        // when
        loadView()
        
        //Then
        XCTAssertNotNil(controller, "Controller should not be nil")
        XCTAssertNotNil(controller.presenter, "presenter should not be nil")
        XCTAssertNotNil(controller.router, "router should not be nil")
        XCTAssertNotNil(controller.configurator, "configurator should not be nil")
    }
    
    func testSetupUI() {
        // when
        loadView()
        
        //Then
        XCTAssertEqual(controller.navigationItem.title, CategoryListViewController.Constant.title, "Both strings should be equal")
    }
    
    func testFetchCategoryList() {
        
        // Given
        presenter = MockCategoryListPresenter()
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.fetchCategoryListCalled)
    }
    
    func testCountOfCategories_Getter() {
        
        // Given
        presenter = MockCategoryListPresenter()
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.countOfCategoriesCalled)
    }
    
}

class MockCategoryListPresenter: CategoryListPresenter {
    
    init() {
        fetchCategoryList()
    }
    
    var fetchCategoryListCalled = false
    func fetchCategoryList() {
        fetchCategoryListCalled = true
    }
    
    var categoryAtIndexCalled = false
    func category(at index: Int) -> CategoryItem? {
        categoryAtIndexCalled = true
        return nil
    }
    
    var countOfCategoriesCalled = false
    var countOfCategories: Int {
        countOfCategoriesCalled = true
        return 2
    }
}
