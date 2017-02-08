//
//  DetailConfigurator.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class DetailConfigurator {

    func configure(_ view: DetailViewController) {
        let presenter = DetailPresenter()
        view.presenter = presenter
        presenter.view = view
    }

}
