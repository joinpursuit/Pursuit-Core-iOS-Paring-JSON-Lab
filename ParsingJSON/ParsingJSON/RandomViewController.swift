//
//  RandomViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/26/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var randomPeople = [RandomPerson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUp(){
        randomPeople = RandomPerson.getPeople()
    }

}

extension RandomViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "randomCell", for: indexPath)
        xCell.textLabel?.text = "\(randomPeople[indexPath.row].name.title) \(randomPeople[indexPath.row].name.first) \(randomPeople[indexPath.row].name.last)"
        xCell.detailTextLabel?.text = randomPeople[indexPath.row].email
        return xCell
    }
}

extension RandomViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedRandomVC = newStoryboard.instantiateViewController(identifier: "detailedRandomVC") as? DetailedRandomViewController else{
            fatalError("Could not instantiate new instance of DetailedRandomViewController")
        }
        detailedRandomVC.currentPerson = randomPeople[indexPath.row]
        navigationController?.pushViewController(detailedRandomVC, animated: true)
    }
}
