//
//  DetailConfiguratorTests.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import XCTest
@testable import WeatherService

class DetailConfiguratorTests: XCTestCase {

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
        let view = DetailViewControllerMock()

        //when
        Configurator.configure(view: view, presenter: DetailPresenter())

        //then
        XCTAssertNotNil(view.presenter, "presenter is nil after configuration")
        XCTAssertTrue(view.presenter is DetailPresenter, "presenter is not DetailPresenter")

        let presenter: DetailPresenter? = view.presenter as? DetailPresenter
        XCTAssertNotNil(presenter?.view, "view in DetailPresenter is nil after configuration")
    }

    class DetailViewControllerMock: DetailViewController {

    }
}
