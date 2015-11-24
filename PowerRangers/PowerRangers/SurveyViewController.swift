//
//  ViewController.swift
//  Survey
//
//  Created by Jason  on 11/20/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonSurvey(sender: AnyObject) {
    
    (AnyObject).self
        if let url=NSURL(string: "https://www.surveymonkey.com/r/SNVHCZQ") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}

