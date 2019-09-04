//
//  ColorsDetailViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/27/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class ColorsDetailViewController: UIViewController {

    var colors: ColorsInfo!
    
    
    @IBOutlet weak var colorName: UILabel!
  
    
   @IBOutlet weak var rgbLabel: UILabel!
    
    
    @IBOutlet weak var hexLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName()
        hexValues()
        rgbValues()
        view.backgroundColor = UIColor(displayP3Red: CGFloat(colors.rgb.fraction.r) , green: CGFloat(colors.rgb.fraction.g), blue: CGFloat(colors.rgb.fraction.b), alpha: 1)
        
    }
    private func labelName() {
        colorName.text = colors.name.value
    }
    
    private func hexValues() {
        hexLabel.text = colors.rgb.value
        
        
    }
    
    private func rgbValues() {
        rgbLabel.text = colors.hex.clean
        
        
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
