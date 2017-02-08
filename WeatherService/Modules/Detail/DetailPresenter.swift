//
//  DetailPresenter.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol!

    // MARK: - DetailPresenterProtocol

    func handleCityWeather(_ cityWeather: CityWeather) {
        view.showCity(cityWeather.city)
        view.showTemperature(cityWeather.temperatureDescription)
        view.showWeatherType(cityWeather.weatherType)
    }
}
