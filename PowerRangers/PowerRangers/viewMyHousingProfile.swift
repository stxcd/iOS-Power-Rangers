//
//  viewMyHousingProfile.swift
//  PowerRangers
//
//  Created by Zack on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class ViewMyHousingProfile: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

/*
    IBActions
*/

extension ViewMyHousingProfile {
    
    @IBAction func dismissHousingProfile(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
