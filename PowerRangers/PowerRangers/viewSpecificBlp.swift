//
//  SecondViewController.swift
//  PowerRangers
//
//  Created by Tommy on 11/9/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class viewSpecificBlp: UIViewController {
    
    var blp: Blp?
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var roleLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var interestsLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        //load profile from JSON (BlpTableViewController)
        
        if let blp = blp {
            fullNameLabel.text = blp.name
            emailLabel.text = blp.email
            phoneLabel.text = blp.phoneNum
            trackLabel.text = blp.track
            roleLabel.text = blp.role
            classLabel.text = blp.track
            locationLabel.text = blp.location
            interestsLabel.text = blp.interests
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

