//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class editMyProfile: UIViewController, UIPickerViewDelegate{
    
    var location = ["Stamford", "Kettering", "Alpharetta", "Atlanta", "Chicago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
    
        return 1
        
    
    
    }
    
    func pickerView(pickerView: UIPickerView!, numberofRowsinComponent component: Int) -> Int{
    
        return location.count
    
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        
        return location[row]
    }
    
}