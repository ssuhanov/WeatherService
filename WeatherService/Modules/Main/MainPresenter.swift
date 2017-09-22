//
//  MainPresenter.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation

class MainPresenter: Presenter {

    weak var mainView: MainViewProtocol? {
        return self.view as? MainViewProtocol
    }

    func handleCityResults(_ cityResults: [JSONDictonary]) {
        var weatherArray = [CityWeather]()
        cityResults.forEach { cityResult in
            if let cityWeather = CityWeather(from: cityResult) {
                weatherArray.append(cityWeather)
            }
        }
        self.mainView?.showData(with: weatherArray)
    }
    
    func getData() {
        let serverAddress = "http://api.openweathermap.org/data/2.5/group"
        let parameters: JSONDictonary = ["id" : "2643743,6167865,703448,2950158" as AnyObject,
                                         "appid" : "a9c5d3933c9d14e8699c682c39f5cb9d" as AnyObject,
                                         "units" : "metric" as AnyObject]
        Networking.dictionaryRequestGET(withURL: serverAddress, parameters: parameters) { [weak self] (dictResult) in
            if let cityResults = dictResult?["list"] as? [JSONDictonary] {
                self?.handleCityResults(cityResults)
            }
        }
        // get data from server here and call view.showData(...)
    }
    
    func handleCityWeather(_ cityWeather: CityWeather) {
        self.mainView?.showDetailView(DetailViewController.storyboardInstance()) { presenter in
            presenter?.handleCityWeather(cityWeather)
        }
    }
    
}
