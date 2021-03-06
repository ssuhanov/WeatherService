//
//  MainViewController.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, MainViewProtocol {

    var presenter: Presenter!
    var mainPresenter: MainPresenter? {
        return presenter as? MainPresenter
    }
    var weatherArray = [CityWeather]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Configurator.configure(view: self, presenter: MainPresenter())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainPresenter?.getData()
        configureUI()
    }
    
    // MARK: - UI Configuration
    
    func configureUI() {
        navigationItem.title = "Weather"
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
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        mainPresenter?.handleCityWeather(weatherArray[indexPath.row])
    }

    // MARK: - MainViewProtocol
    
    func showData(with weatherArray: [CityWeather]) {
        self.weatherArray = weatherArray
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showDetailView(_ detailView: DetailViewProtocol, with config: @escaping DetailPresenterConfig) {
        detailView.presenterConfig = config
        if let detailView = detailView as? UIViewController {
            DispatchQueue.main.async { [weak self] in
                self?.navigationController?.pushViewController(detailView, animated: true)
            }
        }
    }
    
}
