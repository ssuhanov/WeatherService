//
//  MainConfigurator.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class MainConfigurator {

    func configure(_ view: MainViewController) {
        let presenter = MainPresenter()
        view.presenter = presenter
        presenter.view = view
    }

}
