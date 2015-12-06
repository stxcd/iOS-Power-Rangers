//
//  ViewController.swift
//  MyHousing
//
//  Created by Jason  on 11/23/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class editMyHousing: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// # IBActions

extension editMyHousing {
    
    @IBAction func goToRootVC(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

