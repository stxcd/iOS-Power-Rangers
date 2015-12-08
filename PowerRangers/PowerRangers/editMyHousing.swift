//
//  ViewController.swift
//  MyHousing
//
//  Created by Jason  on 11/23/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class editMyHousing: UIViewController {
    //Fuck this page- Dan     
    
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

}



// # IBActions


extension editMyHousing {
    
    @IBAction func goToRootVC(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func filterSelection(sender: UIButton) {
        if let title = sender.titleLabel?.text {
            addFilter(title)
        }
    }
    
    func addFilter(t:String) {
        filterselctions.append(t)
    }
    
}

