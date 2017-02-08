//
//  DetailPresenterTests.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import XCTest
@testable import WeatherService

class DetailPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockViewController: DetailViewProtocol {
        var presenterConfig: DetailPresenterConfig!
        
        func showCity(_ city: String?) {
            
        }
        
        func showTemperature(_ temperature: String?) {
            
        }
        
        func showWeatherType(_ weatherType: String?) {
            
        }

    }
}
