//
//  DetailPresenter.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class DetailPresenter: Presenter {

    weak var detailView: DetailViewProtocol? {
        return self.view as? DetailViewProtocol
    }
    
    func handleCityWeather(_ cityWeather: CityWeather) {
        detailView?.showCity(cityWeather.city)
        detailView?.showTemperature(cityWeather.temperatureDescription)
        detailView?.showWeatherType(cityWeather.weatherType)
    }
}
