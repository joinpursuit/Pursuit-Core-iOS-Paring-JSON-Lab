//
//  WeatherViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/28/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var WeatherTableView: UITableView!
    
    var weatherCities = [CitiesInfo]() {
        didSet {
            WeatherTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherTableView.dataSource = self
        WeatherTableView.rowHeight = 70
        
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = WeatherTableView.indexPathForSelectedRow, let WeatherDetailViewController = segue.destination as? WeatherDetailViewController else {return}
        let weatherToDetail = weatherCities[indexPath.row]
        WeatherDetailViewController.weather = weatherToDetail
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {fatalError("Couldn't find json file")}
            let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let weatherfromJSON = try CitiesInfo.getWeather(from: data)
            weatherCities = weatherfromJSON
        }
        catch {
            fatalError("error \(JSONError.self)")
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherCities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = WeatherTableView.dequeueReusableCell(withIdentifier: "citiesNames")
        cell?.textLabel?.text = weatherCities[indexPath.row].name
        return cell!
    }
}
