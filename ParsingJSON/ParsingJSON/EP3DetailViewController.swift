//
//  EP3DetailViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP3DetailViewController: UIViewController {

    var users: Results?
    
    @IBOutlet weak var userLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        guard let validUser = users else{
            fatalError("check prepare for segue")
        }
        
        userLabel.text = "Full Address: \(validUser.location.street.number) \(validUser.location.street.name)\(validUser.location.city)\(validUser.location.state)\(validUser.location.country)\(validUser.location.postcode)\nPhoneNumber: \(validUser.phone)\nDOB: \(validUser.dob.date)"
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
