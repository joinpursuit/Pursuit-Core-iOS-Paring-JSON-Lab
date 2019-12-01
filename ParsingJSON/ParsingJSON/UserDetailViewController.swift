//
//  UserDetailViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/28/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var userdata: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let userdetails = userdata else {
            fatalError("userdata is nil, verify prepare for segue")
        }
        addressLabel.text = "Address: \(userdetails.location.street.number), \(userdetails.location.street.name)\n \(userdetails.location.city)\n \(userdetails.location.state)\n \(userdetails.location.country)"
        phoneLable.text = "Home phone number is \(userdetails.phone)\n cell phone is \(userdetails.cell)"
        dateOfBirthLabel.text = "Date of birth is \(userdetails.dob.date)\n Full age: \(userdetails.dob.age)"
    }
}
