//
//  DetailedColourViewController.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailedColourViewController: UIViewController {

    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var currentColour: Colour?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        guard let currColour = currentColour else {
            print("Colour variable has no value.")
            return
        }
        nameLabel.text  = currColour.name.value
        hexLabel.text = "Hexadecimal value: \(currColour.hex.value)"
        redLabel.text = "R value: \(String(format:"%0.f", currColour.rgb.fraction.r * 255))"
        greenLabel.text = "G value: \(String(format:"%0.f", currColour.rgb.fraction.g * 255))"
        blueLabel.text = "B value: \(String(format:"%0.f", currColour.rgb.fraction.b * 255))"
    }

}
