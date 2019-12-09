//
//  ColorsDetailViewController.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ColorsDetailViewController: UIViewController {
    
    
    @IBOutlet weak var rgbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var color: Color!
    lazy var r = Double(color.rgb.r)
    lazy var g = Double(color.rgb.g)
    lazy var b = Double(color.rgb.b)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbLabel.text = color.rgb.value
        hexLabel.text = color.hex.value
        view.backgroundColor = UIColor(displayP3Red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: 1)

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
