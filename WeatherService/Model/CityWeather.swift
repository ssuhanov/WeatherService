//
//  CityWeather.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 2/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

class CityWeather {
    
    var city: String
    var temperature: Double
    var temperatureDescription: String {
        return "\(temperature>0 ? "+" : "")\(String(format: "%.1f", temperature))"
    }
    var weatherType: String
    
    init?(from dictResult: JSONDictonary) {
        guard let cityName = dictResult["name"] as? String else {
            return nil
        }
        
        guard let main = dictResult["main"] as? JSONDictonary, let temp = main["temp"] as? Double else {
            return nil
        }
        
        let weather = dictResult["weather"] as? [JSONDictonary]
        let description = weather?.first?["description"] as? String
        
        self.city = cityName
        self.temperature = temp
        self.weatherType = description ?? ""
    }
    
}
