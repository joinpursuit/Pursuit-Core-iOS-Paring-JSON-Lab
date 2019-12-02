//
//  EP1DetailViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 11/26/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP1DetailViewController: UIViewController {
    
    var weatherData: HeadLineData?
    
    @IBOutlet weak var tempLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        guard let validWeatherData = weatherData else{
            fatalError("check prepare for segue")
        }
        
        tempLabel.text = "Name: \(validWeatherData.name)\nTemp: \(validWeatherData.main["temp"]!)"
    }

}
