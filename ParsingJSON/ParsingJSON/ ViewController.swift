//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/26/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = [WeatherInCity]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UILabel.text = cities.name
        tableView.dataSource = self
        navigationItem.title = "CITIES"
        loadData()
    }
    
    func loadData() {
        cities = WeatherData.getWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherVC = segue.destination as? WeatherDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector")
        }
        let city = cities[indexPath.row]
        
        weatherVC.cityweather = city
    }
}
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // 1. get destination view controller
//     // 2. indexpath user selected from the tableview
//     guard let newsDetailController = segue.destination as? NewsDetailController,
//         let indexPath = tableView.indexPathForSelectedRow else {
//         fatalError("verify class name in identity inspector")
//     }
//
//     // 3. get the selected headline
//     let headline = headlines[indexPath.row]
//
//     // 4. set the newsDetailController newsHeadline
//     newsDetailController.newsHeadline = headline
// }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count //should be 15 cities
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)

        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city.name

        return cell
    }
}

