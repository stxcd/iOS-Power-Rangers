//
//  ViewController.swift
//  MyHousing
//
//  Created by Jason  on 11/23/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class editMyHousing: UIViewController {
    
    
    @IBOutlet weak var price1: UIButton!
    @IBOutlet weak var price2: UIButton!
    @IBOutlet weak var price3: UIButton!
    @IBOutlet weak var gender1: UIButton!
    @IBOutlet weak var gender2: UIButton!
    @IBOutlet weak var gender3: UIButton!
    @IBOutlet weak var pet: UIButton!
    @IBOutlet weak var wm: UIButton!
    @IBOutlet weak var pool: UIButton!
    @IBOutlet weak var gym: UIButton!
    @IBOutlet weak var home1: UIButton!
    @IBOutlet weak var home2: UIButton!
    @IBOutlet weak var home3: UIButton!
    @IBOutlet weak var smoke1: UIButton!
    @IBOutlet weak var smoke2: UIButton!
    @IBOutlet weak var smoke3: UIButton!
    
    weak var parent:ViewMyHousingProfile?

    var filterselctions = [String] ()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        buildButtonDictionary()
        
    }
    
    func buildButtonDictionary() -> [Int:[UIButton]] {
        let buttonDictionary:[Int:[UIButton]] = [1:[price1, price2, price3], 2:[gender1, gender2, gender3], 3: [pet, wm, pool, gym], 4: [home1, home2, home3], 5: [smoke1, smoke2, smoke3]]
        return buttonDictionary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func save(sender: AnyObject) {
        if let vmp = parent {
            vmp.filterselctions = filterselctions
        }
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func ifRowIsNotSelected(i:Int) -> Bool {
        switch i {
        case 1:
            return checkButtonDictionaryForSelectionOfRow(i)
        case 2:
            return checkButtonDictionaryForSelectionOfRow(i)
        case 3:
            return checkButtonDictionaryForSelectionOfRow(i)
        case 4:
            return checkButtonDictionaryForSelectionOfRow(i)
        case 5:
            return checkButtonDictionaryForSelectionOfRow(i)
        default:
            return true
        }
    }
    
    func checkButtonDictionaryForSelectionOfRow(r:Int) -> Bool {
        
        var noSelectionInRow = false
        
        let buttonArray = buildButtonDictionary()[r]!
        for button in buttonArray {
            if button.selected {
                noSelectionInRow = false
                break
            }else {
                noSelectionInRow = true
            }
        }
        
        return noSelectionInRow
    }

}



// # IBActions


extension editMyHousing {
    
    @IBAction func goToRootVC(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func filterSelection(sender: UIButton) {
        
        if sender.tag == 3 {
            sender.selected = true
            // do nothing for amenties to allow for multiple selection
        }else {
            
            if ifRowIsNotSelected(sender.tag) {
                sender.selected = true
                
                if let title = sender.titleLabel?.text {
                    addFilter(title)
                }
            }else {
                sender.selected = false
                print("another button in row is selected")
            }
        }
        
    }
    
    func addFilter(t:String) {
        filterselctions.append(t)
    }
    
}

