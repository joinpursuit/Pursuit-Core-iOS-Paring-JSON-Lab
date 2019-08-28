//
//  WeatherViewController.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
    var cities = [City]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = try CityList.getResult(from: data)
            cities = resultsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }
    
    
    override func viewDidLoad() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        loadData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")
        }
        guard let DetailVC = segue.destination as? WeatherDetailVC
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = weatherTableView.indexPathForSelectedRow
            else { fatalError("No row selected") }
        DetailVC.selectedCity = cities[selectedIndexPath.row]
    }

}
