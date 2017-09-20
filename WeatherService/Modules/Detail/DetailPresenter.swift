//
//  DetailPresenter.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class DetailPresenter: Presenter {

    func handleCityWeather(_ cityWeather: CityWeather) {
        let view = self.view as? DetailViewProtocol
        view?.showCity(cityWeather.city)
        view?.showTemperature(cityWeather.temperatureDescription)
        view?.showWeatherType(cityWeather.weatherType)
    }
}
