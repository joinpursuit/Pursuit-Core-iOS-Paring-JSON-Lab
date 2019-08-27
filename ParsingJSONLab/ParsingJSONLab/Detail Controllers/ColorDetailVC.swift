//
//  ColorDetailVC.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ColorDetailVC: UIViewController {

    var selectedColor: ColorValue!
    
    
    @IBOutlet weak var nameOut: UILabel!
    
    @IBOutlet weak var hexOut: UILabel!
    
    
    
    
    override func viewDidLoad() {
        nameOut.text = selectedColor.name.value
        hexOut.text = selectedColor.hex.value
        view.backgroundColor = UIColor(displayP3Red: CGFloat(selectedColor.rgb.fraction.r) , green: CGFloat(selectedColor.rgb.fraction.g), blue: CGFloat(selectedColor.rgb.fraction.b), alpha: 1)
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
