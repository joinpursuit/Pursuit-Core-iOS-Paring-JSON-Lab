//
//  UserGeneratorViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/26/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class UserGeneratorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var results = [Results]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
      //  navigationItem.title = "USERS"
        loadData()
    }
    
    func loadData() {
        results = UserData.getUsersData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDataVC = segue.destination as? UserDetailViewController, let indexPath  = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector")
        }
        
        let result = results[indexPath.row]
        
        userDataVC.userdata = result
    }

}


extension UserGeneratorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count // should be 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let result = results[indexPath.row]
        
        cell.textLabel?.text = result.name.last + " " + result.name.first
        cell.detailTextLabel?.text = result.email
        
        return cell
    }
}
    

