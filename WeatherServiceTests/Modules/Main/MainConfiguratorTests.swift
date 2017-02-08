//
//  MainConfiguratorTests.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import XCTest
@testable import WeatherService

class MainConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {
        //given
        let view = MainViewControllerMock()
        let configurator = MainConfigurator()

        //when
        configurator.configure(view)

        //then
        XCTAssertNotNil(view.presenter, "presenter is nil after configuration")
        XCTAssertTrue(view.presenter is MainPresenter, "presenter is not MainPresenter")

        let presenter: MainPresenter? = view.presenter as? MainPresenter
        XCTAssertNotNil(presenter?.view, "view in MainPresenter is nil after configuration")
    }

    class MainViewControllerMock: MainViewController {

    }
}
