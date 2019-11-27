//
//  ColorDetailViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/27/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    
    var detailColor: Colors?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let color = detailColor else {
            fatalError("detailColor is nil, verify prepare for seque")
        }
    }
    
   // navigationItem.title = color.name.value
//    hexLabel.text = color.hex.value
//    rgbLabel.text = color.rgb.value
    
}


//
//    navigationItem.title = weather.name
//    tempLabel.text = "Current temperature is \(String(weather.main.temp))"
//    minTempLabel.text = "Lowest temperature is \( String(weather.main.temp_min))"
//    maxTempLabel.text = "Warmest temperature is \(String(weather.main.temp_max))"
//    preassureLabel.text = "Air pressure is \(String(weather.main.pressure))"
//    humidityLabel.text = "Humidity is \(String(weather.main.humidity))"
//    windSpeedLabel.text = "Wind speed is \(String(weather.wind.speed))"
//    cloudsLabel.text = "Clouds in the sky: \(String(weather.clouds.all))"
//}
