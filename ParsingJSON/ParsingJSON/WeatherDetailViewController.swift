//
//  WeatherDetailViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/26/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var preassureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    
    
    var cityweather: WeatherInCity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        guard let weather = cityweather else {
            fatalError("cityweather is nil, verify prepare for seque")
        }
        
        navigationItem.title = weather.name
        tempLabel.text = "Current temperature is \(String(weather.main.temp))"
        minTempLabel.text = "Lowest temperature is \( String(weather.main.temp_min))"
        maxTempLabel.text = "Warmest temperature is \(String(weather.main.temp_max))"
        preassureLabel.text = "Air pressure is \(String(weather.main.pressure))"
        humidityLabel.text = "Humidity is \(String(weather.main.humidity))"
        windSpeedLabel.text = "Wind speed is \(String(weather.wind.speed))"
        cloudsLabel.text = "Clouds in the sky: \(String(weather.clouds.all))"
    }
}

