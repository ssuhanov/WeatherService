//
//  CityWeather.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 2/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

typealias JSONDictonary = [String : AnyObject]

class CityWeather {
    
    var city: String
    var temperature: Double
    var weatherType: String
    
//    init(with dictResult: JSONDictonary) {
    init() {
        self.city = "London"
        self.temperature = 3.5
        self.weatherType = "sunny"
    }
    
}
