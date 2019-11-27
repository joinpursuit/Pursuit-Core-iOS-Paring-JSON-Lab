//
//  ColorDetailViewController.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/27/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    
    var detailColor: Colors?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let color = detailColor else {
            fatalError("detailColor is nil, verify prepare for seque")
        }
        navigationItem.title = color.name.value
        hexLabel.text = "Hex is: \(color.hex.value)"
        hexLabel.textColor = .white
        rgbLabel.text = "Value for: \(color.rgb.value)"
        rgbLabel.textColor = .white
        view.backgroundColor = UIColor(red: CGFloat(color.rgb.r)/255, green: CGFloat(color.rgb.g)/255, blue: CGFloat(color.rgb.b)/255, alpha: 1)
    }
}



