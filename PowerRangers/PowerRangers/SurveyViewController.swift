//
//  ViewController.swift
//  Survey
//
//  Created by Jason  on 11/20/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBAction func surveyButton(sender: AnyObject) {
        (AnyObject).self
        if let url=NSURL(string: "https://docs.google.com/document/d/16oD66-suWSMeiYeRl-nlsAhAHfpnGwIYa0_rpfR5S5M/pub") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    

}

