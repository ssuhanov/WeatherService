//
//  MainViewPresenterProtocol.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

typealias DetailPresenterConfig = (DetailPresenter?) -> Void

protocol MainPresenterProtocol {
    func getData()
    func handleCityWeather(_ cityWeather: CityWeather)
}

protocol MainViewProtocol: class {
    func showData(with weatherArray: [CityWeather])
    func showDetailView(_ detailView: DetailViewProtocol, with config: @escaping DetailPresenterConfig)
}
