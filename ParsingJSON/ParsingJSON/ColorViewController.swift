//
//  ColorViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/26/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Colors]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.title = "COLORS"
        loadData()
    }
    
    func loadData() {
        colors = ColorsData.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("verify class name in identity inspector")
    }
    let color = colors[indexPath.row]
    // TODO: add background of the cell
    
    colorVC.detailColor = color
}
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count // should be 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        
        return cell
    }
}

