//
//  ViewProtocol.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 9/20/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import UIKit

protocol ViewProtocol: class {
    
    var presenter: Presenter! { get set }
    
}
