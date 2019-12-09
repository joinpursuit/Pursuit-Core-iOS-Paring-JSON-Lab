//
//  DetailViewController.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class CitiesDetailViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let weather = weather {
            temperatureLabel.text = "\(weather.main.temp) ℃"
            cityLabel.text = weather.name
        }
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
