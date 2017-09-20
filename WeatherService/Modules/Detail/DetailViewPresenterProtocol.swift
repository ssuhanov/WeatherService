//
//  DetailViewPresenterProtocol.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    var presenterConfig: DetailPresenterConfig! { get set }
    
    func showCity(_ city: String?)
    func showTemperature(_ temperature: String?)
    func showWeatherType(_ weatherType: String?)
}
