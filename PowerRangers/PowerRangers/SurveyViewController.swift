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
        if let url=NSURL(string: "http://images.latintimes.com/sites/latintimes.com/files/styles/pulse_embed_breakpoints_theme_lt_desktop_1x/public/2015/01/21/new-england-patriots-deflategate-memes_1.jpg") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}

