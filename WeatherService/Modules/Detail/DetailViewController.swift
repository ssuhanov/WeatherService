//
//  DetailViewController.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 08/02/2017.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {

    var presenter: DetailPresenterProtocol!
    var presenterConfig: DetailPresenterConfig!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = DetailConfigurator()
        configurator.configure(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenterConfig(presenter)
    }

    // MARK: - DetailViewProtocol

}
