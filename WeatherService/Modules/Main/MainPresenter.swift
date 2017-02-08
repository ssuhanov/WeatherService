//
//  MainPresenter.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol!

    // MARK: - MainPresenterProtocol
    
    func getData() {
        // get data from server here and call view.showData(...)
    }
    
    func handleCityWeather(_ cityWeather: CityWeather) {
        view.showDetailView(DetailViewController.storyboardInstance()) { presenter in
            // do something in presenter with cityWeather
        }
    }
    
}
