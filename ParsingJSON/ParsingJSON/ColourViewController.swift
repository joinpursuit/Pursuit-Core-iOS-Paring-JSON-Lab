//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/26/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class ColourViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colours = [Colour]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUp(){
        colours = Colour.getColours()
    }
}

extension ColourViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "colourCell", for: indexPath)
        xCell.backgroundColor = UIColor(displayP3Red: CGFloat(colours[indexPath.row].rgb.fraction.r), green: CGFloat(colours[indexPath.row].rgb.fraction.g), blue: CGFloat(colours[indexPath.row].rgb.fraction.b), alpha: 1)
        xCell.textLabel?.text = colours[indexPath.row].name.value
        return xCell
    }
}

extension ColourViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedColourVC = newStoryboard.instantiateViewController(identifier: "detailedColourVC") as? DetailedColourViewController else {
            fatalError("Could not create an instance of DetailedColourViewController.")
        }
        detailedColourVC.currentColour = colours[indexPath.row]
        navigationController?.pushViewController(detailedColourVC, animated: true)
    }
}
