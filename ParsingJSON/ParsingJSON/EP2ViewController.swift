//
//  EP2ViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 11/26/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP2ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var colors = [Colors](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        colors = Colors.getColor()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ep2DVC = segue.destination as? EP2DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to segue")
        }
        
        let colorObj = colors[indexPath.row]
        ep2DVC.passedColorObj = colorObj
    }
    

}

extension EP2ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EP2Cell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.textLabel?.textColor = UIColor(displayP3Red: CGFloat(1-color.rgb.fraction.r), green: CGFloat(1-color.rgb.fraction.g), blue: CGFloat(1-color.rgb.fraction.r), alpha: 1.0)
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.r), alpha: 1.0)
        
        return cell
    }
}

extension EP2ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
}
