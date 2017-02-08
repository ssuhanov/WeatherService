//
//  UIViewController+Helpers.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 2/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static func storyboardInstancePrivate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let view = storyboard.instantiateInitialViewController() as! T
        return view
    }
    
    static func storyboardInstance() -> Self {
        return storyboardInstancePrivate()
    }
    
    static func navigationStoryboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

}
