//
//  WeatherViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/26/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weatherArr: [Weather] = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUp(){
        weatherArr = WeatherList.getWeather()
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        xCell.textLabel?.text = weatherArr[indexPath.row].name
        return xCell
    }
}

extension WeatherViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedWeatherVC = newStoryboard.instantiateViewController(identifier: "detailedWeatherVC") as? DetailedWeatherViewController else{
            fatalError("Could not create an instance of DetailedWeatherViewController.")
        }
        detailedWeatherVC.currentWeather = weatherArr[indexPath.row]
        navigationController?.pushViewController(detailedWeatherVC, animated: true)
    }
}
