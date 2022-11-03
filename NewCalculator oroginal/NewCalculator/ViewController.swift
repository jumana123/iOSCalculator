//
//  ViewController.swift
//  NewCalculator
//
//  Created by Jumana Rahman on 9/29/20.
//  Copyright © 2020 Jumana Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calc = Calculator()
    
    @IBOutlet weak var label: UILabel!;
    
    @IBAction func numbers(_ sender: UIButton) {
        
        label.text = calc.chooseNumber(num: sender.tag)

    }
        
    @IBAction func clear(_ sender: UIButton) {
        //for the C button
        label.text = calc.clear()
 
    }

    @IBAction func invert(_ sender: UIButton) {
        label.text = calc.invert()
    }

    @IBAction func percentify(_ sender: UIButton) {
        label.text = calc.percentify()
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        label.text = calc.equal()
    }
    
    @IBAction func operations(_ sender: UIButton) {
        //add: 17 |subtract: 16 | divide: 14 | multiply: 15 | equal: 18
        label.text = calc.chooseOperation(choose: sender.tag)
       
    }
    
}
