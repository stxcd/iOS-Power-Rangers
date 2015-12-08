//
//  PickerViewContainer.swift
//  PowerRangers
//
//  Created by Trace Pomplun on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

protocol DismissPickerView:class {
    func dismissPickerView(s:String)
}

class PickerViewContainer:UIView {
    
    @IBOutlet weak var pickerView:UIPickerView!
    
    weak var delegate:DismissPickerView?
    
    var selectedTextField:UITextField?
    
    var selectedIndex = 0
    let locationTextField = 1
    let trackTextField = 5
    let nextLocationTextField = 8
    
    let pickerArrays = [0:["Alpharetta", "Atlanta", "Canton", "Charlotte", "Chicago", "Costa Mesa", "Kettering", "St. Paul", "Stamford"], 1:["Audit", "Data Analytics", "Finance", "HR", "IT", "Marketing", "Operations", "Risk", "Sales"]]
    
    func pickerViewForIndex(i:Int) {
        pickerView.hidden = false
        pickerView.reloadAllComponents()
        selectedIndex = i
    }
    
    func setup() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
}

extension PickerViewContainer:UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch selectedIndex {
        case locationTextField:
            return pickerArrays[0]!.count
        case trackTextField:
            return pickerArrays[1]!.count
        case nextLocationTextField:
            return pickerArrays[0]!.count
        default:
            break
        }
        return 0
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch selectedIndex {
        case locationTextField:
            print(row)
            let row = pickerArrays[0]![row]
            print(row)
            return row
        case trackTextField:
            let row = pickerArrays[1]![row]
            print(row)
            return row
        case nextLocationTextField:
            let row = pickerArrays[0]![row]
            print(row)
            return row
        default:
            break
        }
        return nil
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch selectedIndex {
        case locationTextField:
            let s = pickerArrays[0]![row]
            self.delegate?.dismissPickerView(s)
        case trackTextField:
            let s = pickerArrays[1]![row]
            self.delegate?.dismissPickerView(s)
        case nextLocationTextField:
            let s = pickerArrays[0]![row]
            self.delegate?.dismissPickerView(s)
        default:
            break
        }
        
    }
}