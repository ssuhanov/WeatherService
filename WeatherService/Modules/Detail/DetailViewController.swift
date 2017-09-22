//
//  DetailViewController.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: Presenter!

    var presenterConfig: DetailPresenterConfig!

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        Configurator.configure(view: self, presenter: DetailPresenter())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenterConfig(self.presenter as? DetailPresenter)
        
        configureUI()
    }

    // MARK: - UI Configuration
    
    func configureUI() {
        navigationItem.title = "Weather for city"
    }
    
    // MARK: - DetailViewProtocol

    func showCity(_ city: String?) {
        cityLabel.text = city
    }
    
    func showTemperature(_ temperature: String?) {
        temperatureLabel.text = temperature
    }
    
    func showWeatherType(_ weatherType: String?) {
        weatherTypeLabel.text = weatherType
    }
    
}
