//
//  EP3ViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP3ViewController: UIViewController {
    
    

    @IBOutlet weak var tableView:UITableView!
        
        var users = [Results](){
            didSet{
                tableView.reloadData()
            }
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
            users = Results.getUsers()
            // Do any additional setup after loading the view.
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let ep3DVC = segue.destination as? EP3DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("failed to segue")
            }
            
            let userObj = users[indexPath.row]
            ep3DVC.users = userObj
        }
        

    }

    extension EP3ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EP3Cell", for: indexPath)
            
            let user = users[indexPath.row]
            
            cell.textLabel?.text = "\(user.name.title) \(user.name.first) \(user.name.last)"
            cell.detailTextLabel?.text = user.email
            
            
            return cell
        }
    }

    extension EP3ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 180.0
        }
    }
