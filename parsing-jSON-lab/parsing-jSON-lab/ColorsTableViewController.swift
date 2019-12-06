//
//  ColorsViewController.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ColorsTableViewController: UIViewController {
    
//    let url = "http://thecolorapi.com/scheme?hex=0047AB&rgb=0,71,171&hsl=215,100%,34%&cmyk=100,58,0,33&format=json&mode=analogic&count=6"
    
    var colors: [Color]! {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    @IBOutlet weak var colorTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureTableView()
    }
    
    private func configureTableView() {
        colorTableView.delegate = self
        colorTableView.dataSource = self
    }
    
    private func loadData() {
        guard let pathToData = Bundle.main.path(forResource: "colors", ofType: "json") else {
            fatalError("Invalid path, .json file not found")
        }
        
        let internalURL = URL(fileURLWithPath: pathToData)
        
        do {
            let data = try Data(contentsOf: internalURL)
            colors = try Color.getColors(from: data)
        } catch {
            fatalError("Error occurred running JSON: \(error)")
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ColorsTableViewController: UITableViewDelegate {}
extension ColorsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        cell.textLabel?.text = colors[indexPath.row].name.value
        cell.textLabel?.textColor = .white
        let r = Double(colors[indexPath.row].rgb.r)
        let g = Double(colors[indexPath.row].rgb.g)
        let b = Double(colors[indexPath.row].rgb.b)
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: 1)
        return cell
    }
    
    
}
