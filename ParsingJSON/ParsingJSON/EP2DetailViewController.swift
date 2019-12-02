//
//  EP2DetailViewController.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP2DetailViewController: UIViewController {

    var passedColorObj: Colors?
    
    @IBOutlet weak var hexRGBLabel:UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        guard let validColor = passedColorObj else{
            fatalError("check prepare for segue")
        }
        
        hexRGBLabel.text = "Hex: \(validColor.hex.clean)\nRGB: \(validColor.rgb.value)"
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
