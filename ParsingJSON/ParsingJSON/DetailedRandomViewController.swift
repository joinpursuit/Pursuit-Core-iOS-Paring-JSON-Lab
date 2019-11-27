//
//  DetailedRandomViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailedRandomViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var currentPerson: RandomPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        
        guard let curPerson = currentPerson else{
            fatalError("Variable of type RandomPerson has no value")
        }
        var postalValueInt = 0
        var postalValueString = ""
        switch curPerson.location.postcode{
        case .int(let value):
            postalValueInt = value
        case .string(let value):
            postalValueString = value
        }
        
        var postalCode: Any
        if postalValueInt == 0{
            postalCode = postalValueString
        } else {
            postalCode = postalValueInt
        }
        
        nameLabel.text = "\(curPerson.name.first) \(curPerson.name.last)"
        dobLabel.text = "Date of Birth: \(formatDate(date: curPerson.dob.date))"
        phoneLabel.text = "Phone Number: \(curPerson.phone)"
        addressLabel.text = "Address: \(curPerson.location.street.number) \(curPerson.location.street.name) \(curPerson.location.city), \(curPerson.location.state), \(postalCode)"
    }
    
    private func formatDate(date: String) -> String{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime,
                                          .withDashSeparatorInDate,
                                          .withFullDate,
                                          .withFractionalSeconds,
                                          .withColonSeparatorInTimeZone]
        isoDateFormatter.timeZone = TimeZone.current
        let dateFormatter = DateFormatter()
        guard let dateOfBirth = isoDateFormatter.date(from: date) else{
            return ""
        }
        
        dateFormatter.dateFormat = "MMMM, dd, yyyy"
        let dateFormattedString = dateFormatter.string(from: dateOfBirth)
        return dateFormattedString
    }

}
