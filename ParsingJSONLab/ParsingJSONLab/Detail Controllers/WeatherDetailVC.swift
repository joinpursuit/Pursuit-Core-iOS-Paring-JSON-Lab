//
//  WeatherDetailVC.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {

    var selectedCity: City!
    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    
    
    @IBOutlet weak var conditionsLabel: UILabel!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        cityNameLabel.text = selectedCity.name
        conditionsLabel.text = selectedCity.weather[0].description
        tempLabel.text = " \( String(selectedCity.weather[0].id)) degrees"
        mainLabel.text = selectedCity.weather[0].main
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
