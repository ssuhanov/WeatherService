//
//  MainViewController.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, MainViewProtocol {

    var presenter: MainPresenterProtocol!
//    var weatherArray = [CityWeather]()
    var weatherArray = [CityWeather(), CityWeather(), CityWeather()]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let configurator = MainConfigurator()
        configurator.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.getData()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Weather"
    }
    
    // MARK: - UI Configuration
    
    func configureUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherTableViewCell
        cell.configureCell(with: weatherArray[indexPath.row])
        return cell
    }

    // MARK: - MainViewProtocol
    
    func showData(with weatherArray: [CityWeather]) {
        self.weatherArray = weatherArray
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
