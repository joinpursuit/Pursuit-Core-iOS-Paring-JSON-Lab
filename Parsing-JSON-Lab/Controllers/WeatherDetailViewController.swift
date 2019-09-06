//
//  WeatherDetailViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/28/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit



class WeatherDetailViewController: UIViewController {

    var weather: CitiesInfo!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentWeather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel()
        tempLabel()
        weatherLabel()
        
    }
    private func nameLabel() {
        cityName.text = ("City: \(weather.name)")
    }

    private func tempLabel() {
        currentTemp.text = ("Main Temperature: \(weather.main.temp.description) F")
    }
    
    private func weatherLabel() {
        currentWeather.text = ("Current Weather: \(weather.weather[0].description)")
        //It's an Array so we have to access it this way
    }
}
