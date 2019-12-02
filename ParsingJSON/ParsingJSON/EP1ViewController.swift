//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 11/25/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP1ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var headLines = [HeadLineData](){
        didSet{
            tableView.reloadData()
            //tableView.dataSource = self
        }
    }
    
//    var weatherDescs = [WeatherDesc](){
//        didSet{
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        headLines = Weather.getWeather()
        dump(Weather.getWeather())
        //print(Weather.getWeather())
        //weatherDescs = Weather.getWeather()[0...14].weather
        //dump(headLines.filter{$0.weather == "main"}.first)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ep1DVC = segue.destination as? EP1DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to segue")
        }
        
        let weather = headLines[indexPath.row]
        ep1DVC.weatherData = weather
    }


}

extension EP1ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? Cell else {
            fatalError("failed to deque cell, check identifier")
        }
        let headline = headLines[indexPath.row]
        //let weatherDesc = weatherDescs[indexPath.row]
        
        cell.configureCellForTab1(for: headline)
        
        return cell
    }
}

extension EP1ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
}
