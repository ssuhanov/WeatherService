//
//  CityWeatherTests.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 9/16/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import XCTest
@testable import WeatherService

class CityWeatherTests: XCTestCase {
    
    var instance: CityWeather?
    let mainDictResult: JSONDictonary = ["temp" : 23.5 as AnyObject]
    var dictResultWithName: JSONDictonary = ["name": "Moncton" as AnyObject]
    let dictResultWithoutName: JSONDictonary = ["notName" : "Moncton" as AnyObject]
    
    override func setUp() {
        super.setUp()
        self.dictResultWithName["main"] = self.mainDictResult as AnyObject
    }
    
    func testNameUpdatesCorrectly() {
        self.instance = CityWeather(from: self.dictResultWithName)
        XCTAssertEqual(self.instance?.city, "moncton", "city name should be \"Moncton\"")
        XCTAssertEqual(self.instance?.temperature, 24.5, "temperature should be 23.5")
    }
    
    func testEmptyNameReturnsNil() {
        self.instance = CityWeather(from: self.dictResultWithoutName)
        XCTAssertNil(self.instance, "city weather without name should be nil")
    }
    
}
