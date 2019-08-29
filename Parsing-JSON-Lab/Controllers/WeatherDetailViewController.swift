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
        cityName.text = weather.name
    }

    private func tempLabel() {
        currentTemp.text = weather.main.temp.description
    }
    
    private func weatherLabel() {
        currentWeather.text = weather.weather.weather.description
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
