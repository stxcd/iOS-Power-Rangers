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
    
    var housingArray = [BlpHousing]()
    var filterlabel = [String]()
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var roleLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var interestsText: UILabel!
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var nextLocationLabel: UILabel!
    
    @IBOutlet weak var viewHousing: UIButton!
    
    override func viewDidLoad() {
        
        //load profile from JSON (BlpTableViewController)
        
        if let blp = blp {
            fullNameLabel.text = blp.name + " " + blp.lastName
            emailLabel.text = blp.email
            phoneLabel.text = blp.phoneNum
            trackLabel.text = blp.track
            roleLabel.text = blp.role
            classLabel.text = "2017"
            locationLabel.text = blp.location
            interestsText.text = blp.interests
            nextLocationLabel.text = blp.nextLocation
            
            //set housing button visability
            let checkHousing = blp.housing
            if checkHousing == "Yes" {
                viewHousing.hidden = false
            } else {
                if checkHousing == "No" {
                    viewHousing.hidden = true
                } else {
                print("check not working")
            }
            }
            
            //image pull
            
            let useName = blp.lastName
            let blpImage = UIImage(named: useName)
            
            photoView.image = blpImage
            print(checkHousing)
            
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
           }
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHousing" {
            let destination = segue.destinationViewController as! BlpHousingViewController
            let path = Int((blp?.identifier)!)
                destination.ident = path!
        
            if let blpHousing = segue.destinationViewController as? BlpHousingViewController {
                blpHousing.blp = blp
            }
            
        } 
    }

}



