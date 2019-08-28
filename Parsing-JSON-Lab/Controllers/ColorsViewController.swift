//
//  ColorsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/27/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    
    
    @IBOutlet weak var ColorsTableView: UITableView!
    
    var allColors = [ColorsInfo]() {
        didSet {ColorsTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorsTableView.dataSource = self
        loadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = ColorsTableView.indexPathForSelectedRow, let ColorsDetailViewController = segue.destination as? ColorsDetailViewController else {return}
        let colorsToDetail = allColors[indexPath.row]
        ColorsDetailViewController.colors = colorsToDetail
        
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "colors", ofType: "json") else {fatalError("Couldn't find json file")}
            let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            self.allColors =  try AllColors.getColors(from: data)
        }
        catch {
            print(error)
        }
    }
}
extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ColorsTableView.dequeueReusableCell(withIdentifier: "colorsInfoCell")
        cell?.textLabel?.text = allColors[indexPath.row].name.value
        cell?.detailTextLabel?.text = "hex:\(allColors[indexPath.row].hex.value)"
        return cell!
    }
    
    
}

