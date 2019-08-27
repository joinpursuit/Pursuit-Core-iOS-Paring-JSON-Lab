//
//  ColorsViewController.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colors = [ColorValue]() {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    @IBOutlet weak var colorTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name.value
        cell.detailTextLabel?.text = color.hex.value
        cell.backgroundColor = UIColor.init(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func viewDidLoad() {
        colorTableView.delegate = self
        colorTableView.dataSource = self
        loadData()
        print(colors)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try Colors.getColors(from: data)
            colors = colorsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")
        }
        guard let ColorDetailVC = segue.destination as? ColorDetailVC
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = colorTableView.indexPathForSelectedRow
            else { fatalError("No row selected") }
        ColorDetailVC.selectedColor = colors[selectedIndexPath.row]
    }

}
