//
//  MainViewPresenterProtocol.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {
    func getData()
}

protocol MainViewProtocol: class {
    func showData(with weatherArray: [CityWeather])
}
