//
//  DetailedWeatherViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailedWeatherViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var currentWeather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        cityNameLabel.text = currentWeather?.name
        temperatureLabel.text = "The current temperature is: \(String(format: "%.2f", currentWeather?.main.temp ?? 0.0))"
        if let curWeather = currentWeather{
            weatherLabel.text = "Today \(curWeather.name) will have \(curWeather.weather[0].description)"
        }
    }

}
