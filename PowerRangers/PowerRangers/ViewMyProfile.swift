//
//  ViewController.swift
//  My Profile
//
//  Created by Jason  on 11/23/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class ViewMyProfile: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!

    var dataPassed:String!
    var secondDataPassed:String!
    var thirdDataPassed:String!
    var newvar: String!
    var newvar2: String!
    var newvar3: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = dataPassed
        locationLabel.text = secondDataPassed
        classLabel.text = thirdDataPassed
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //println(newvar)
    //println(newvar2)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

