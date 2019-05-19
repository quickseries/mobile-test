//
//  ResourceListViewControllerTests.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import XCTest
@testable import QuickMobileTest

class ResourceListViewControllerTests: BaseTestCase {
    
    var controller: ResourceListViewController!
    var presenter: MockResourceListPresenter!
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
        controller =  ViewUtility.getResourceListViewController()
    }
    
    private func loadView() {
        window.addSubview(controller.view)
        RunLoop.current.run(until: Date())
    }
    
    func testSetup() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Restaurant", description: "", type: .restaurant))
        
        // when
        loadView()
        
        //Then
        XCTAssertNotNil(controller, "Controller should not be nil")
        XCTAssertNotNil(controller.presenter, "presenter should not be nil")
        XCTAssertNotNil(controller.router, "router should not be nil")
        XCTAssertNotNil(controller.configurator, "configurator should not be nil")
    }
    
    func testSetupUI_For_Restaurant() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Restaurant", description: "", type: .restaurant))
        
        // when
        loadView()
        
        //Then
        XCTAssertEqual(controller.navigationItem.title, ResourceListViewController.Constant.restaurants, "Both strings should be equal")
    }
    
    func testSetupUI_For_VacationSpots() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Vacaction", description: "", type: .vacationSpots))
        
        // when
        loadView()
        
        //Then
        XCTAssertEqual(controller.navigationItem.title, ResourceListViewController.Constant.vacationSpots, "Both strings should be equal")
    }
    
    
    func testFetchResourceList_Method() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Restaurant", description: "", type: .restaurant))
        presenter = MockResourceListPresenter(type: .restaurant)
        
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.fetchResourceListCalled)
    }
    
    func testCountOfResources_Getter() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Restaurant", description: "", type: .restaurant))
        presenter = MockResourceListPresenter(type: .restaurant)
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.countOfResourcesCalled)
    }
    
    func testSortList_Method() {
        
        // Given
        controller.configurator = ResourceListConfigurator(categoryItem: CategoryItem(title: "Restaurant", description: "", type: .restaurant))
        presenter = MockResourceListPresenter(type: .restaurant)
        
        // when
        loadView()
        controller.presenter = presenter
        controller.buttonFilterTapped()
        
        //Then
        XCTAssertTrue(presenter.sortListCalled)
    }
    
}

class MockResourceListPresenter: ResourceListPresenter {
    
    init(type: CategoryType) {
        fetchResourceList(with: type)
    }
    
    var fetchResourceListCalled = false
    func fetchResourceList(with categoryType: CategoryType) {
        fetchResourceListCalled = true
    }
    
    var resourceAtIndexCalled = false
    func resource(at index: Int) -> ResourceItem? {
        resourceAtIndexCalled = true
        return nil
    }
    
    var countOfResourcesCalled = false
    var countOfResources: Int {
        countOfResourcesCalled = true
        return 2
    }
    
    var sortListCalled = false
    func sortList(by type: SortType) {
        sortListCalled = true
    }
    
    
}
