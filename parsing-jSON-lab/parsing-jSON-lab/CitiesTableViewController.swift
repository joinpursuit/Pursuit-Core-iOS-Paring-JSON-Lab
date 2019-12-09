//
//  ViewController.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 11/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class CitiesTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weather = [Weather]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViews()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func configureTableViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func loadData() {
        guard let pathToData = Bundle.main.path(forResource: "city", ofType: "json") else {
            fatalError("city.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let weatherFromJSON = try Weather.getWeather(from: data)
            weather = weatherFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CitiesDetailViewController {
            destination.weather = weather[self.tableView.indexPathForSelectedRow!.row]
        }
    }

}

extension CitiesTableViewController: UITableViewDelegate {}

extension CitiesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        let weathercell = weather[indexPath.row]
        cell.textLabel?.text = weathercell.name
        return cell
    }
}


