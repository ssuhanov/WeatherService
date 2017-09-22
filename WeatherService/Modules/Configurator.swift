//
//  Configurator.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 9/20/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

class Configurator {
    
    static func configure<T: ViewProtocol, U: Presenter>(view: T, presenter: U) {
        view.presenter = presenter
        presenter.view = view
    }
    
}
