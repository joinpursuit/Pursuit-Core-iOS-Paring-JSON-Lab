//
//  UsersViewController.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users = [Result]() {
        didSet {
            userTableView.reloadData()
        }
    }
    
    @IBOutlet weak var userTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name.fullName()
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
    

    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "users", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = try Result.getResult(from: data)
            users = resultsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")
        }
        guard let UserDetailVC = segue.destination as? UsersDetailVC
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = userTableView.indexPathForSelectedRow
            else { fatalError("No row selected") }
        UserDetailVC.selectedUser = users[selectedIndexPath.row]
    }

    
    override func viewDidLoad() {
        userTableView.delegate = self
        userTableView.dataSource = self
        loadData()
        print(users)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
