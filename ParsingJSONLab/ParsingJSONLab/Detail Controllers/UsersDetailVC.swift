//
//  UsersDetailVC.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class UsersDetailVC: UIViewController {
    
    var selectedUser: Result!
    
    @IBOutlet weak var DOBOut: UILabel!
    
    @IBOutlet weak var nameOut: UILabel!
    
    @IBOutlet weak var phoneOut: UILabel!
    
    @IBOutlet weak var adressOut: UILabel!
    
    
    
    
    override func viewDidLoad() {
        DOBOut.text = "DOB: \(selectedUser.dob.date)"
        nameOut.text = selectedUser.name.fullName()
        phoneOut.text = "Phone: \(selectedUser.phone)"
        adressOut.text = "Address: \(selectedUser.location.fullAddress())"
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
