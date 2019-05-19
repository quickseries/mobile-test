//
//  ResourceDetailsViewControllerTests.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import XCTest
@testable import QuickMobileTest

class ResourceDetailsViewControllerTests: BaseTestCase {

    var controller: ResourceDetailsViewController!
    var presenter: MockResourceDetailsPresenter!
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
        controller =  ViewUtility.getResourceDetailsViewController()
    }
    
    private func loadView() {
        window.addSubview(controller.view)
        RunLoop.current.run(until: Date())
    }
    
    func testSetup() {
        
        // Given
        controller.configurator = ResourceDetailsConfigurator(resourceItem: ResourceItem(title: "Pizza Spanos", description: "", isActive: false, sectionTypes: [SectionItemType]()))
        
        // when
        loadView()
        
        //Then
        XCTAssertNotNil(controller, "Controller should not be nil")
        XCTAssertNotNil(controller.presenter, "presenter should not be nil")
        XCTAssertNotNil(controller.router, "router should not be nil")
        XCTAssertNotNil(controller.configurator, "configurator should not be nil")
    }
    
    func testSetupUI() {
        // Given
        let title = "Pizza Spanos"
        controller.configurator = ResourceDetailsConfigurator(resourceItem: ResourceItem(title: title, description: "", isActive: false, sectionTypes: [SectionItemType]()))
        
        // when
        loadView()
        
        //Then
        XCTAssertEqual(controller.navigationItem.title, title, "Both strings should be equal")
    }

    func testNumberOfSections_Method() {
        
        // Given
        controller.configurator = ResourceDetailsConfigurator(resourceItem: ResourceItem(title: "Pizza Spanos", description: "", isActive: false, sectionTypes: [SectionItemType]()))
        presenter = MockResourceDetailsPresenter()
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.numberOfSectionsCalled)
    }
    
    
    func testNumberOfRows_Method() {
        
        // Given
        controller.configurator = ResourceDetailsConfigurator(resourceItem: ResourceItem(title: "Pizza Spanos", description: "", isActive: false, sectionTypes: [SectionItemType]()))
        presenter = MockResourceDetailsPresenter()
        
        // when
        loadView()
        controller.presenter = presenter
        controller.reloadData()
        
        //Then
        XCTAssertTrue(presenter.numberOfRowsCalled)
    }
    
}

class MockResourceDetailsPresenter: ResourceDetailsPresenter {
    
    var numberOfSectionsCalled = false
    var numberOfSections: Int {
        numberOfSectionsCalled = true
        return 3
    }
    
    var numberOfRowsCalled = false
    func numberOfRows(in section: Int) -> Int {
        numberOfRowsCalled = true
        return 4
    }
    
    var sectionItemTypeCalled = false
    func sectionItemType(at section: Int) -> SectionItemType? {
        sectionItemTypeCalled = true
        return nil
    }
    
    var sectionTitleCalled = false
    func sectionTitle(for section: Int) -> String? {
        sectionTitleCalled = true
        return nil
    }
    
    var heightForRowCalled = false
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        heightForRowCalled = true
        return 0
    }
    
}
