//
//  CityWeatherTableViewCell.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 2/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    func configureCell(with cityWeather: CityWeather) {
        cityLabel.text = cityWeather.city
        temperatureLabel.text = String(format: "%.1f", cityWeather.temperature)
        weatherTypeLabel.text = cityWeather.weatherType
    }

}
