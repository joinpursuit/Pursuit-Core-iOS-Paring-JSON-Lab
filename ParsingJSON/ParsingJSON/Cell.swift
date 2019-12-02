//
//  Cell.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 11/25/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var label1:UILabel!
    @IBOutlet weak var label2:UILabel!
    
    //tab 1
    func configureCellForTab1(for headlineData: HeadLineData){
        label1.text = headlineData.name
        label2.text =  headlineData.main["temp"]?.description
    }
}
