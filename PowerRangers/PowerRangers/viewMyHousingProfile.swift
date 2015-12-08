//
//  viewMyHousingProfile.swift
//  PowerRangers
//
//  Created by Zack on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class ViewMyHousingProfile: UIViewController {
    
    //Here's the Properties

    @IBOutlet weak var price: UIImageView!
    @IBOutlet weak var smoking: UIImageView!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var housing: UIImageView!
    @IBOutlet weak var amen1: UIImageView!
    @IBOutlet weak var amen2: UIImageView!
    @IBOutlet weak var amen3: UIImageView!
    @IBOutlet weak var amen4: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var filterselctions:[String]?
    var filterlabels:[String]?
    
    var profileValues:[String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if let fs = filterselctions {
            sortFilters(fs)
        }
        setProfileValues()
    }
    
    func setProfileValues() {
        if let pValues = profileValues {
            for (k,v) in pValues {
                switch k {
                    case "name":
                    name.text = v
                    case "email":
                    email.text = v
                    case "location":
                    location.text  = v
                    case "year":
                    year.text = v
                default:
                    break
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? editMyHousing {
            destination.parent = self
        }
    }
    
    func sortFilters(filters:[String]) {
        for filters in filters {
            switch filters {
            case "$1000":
                price.image = UIImage(named: "Price1")
            case "$1500":
                price.image = UIImage(named: "Price2")
            case "$2000":
                price.image = UIImage(named: "Price3")
            case "Male":
                gender.image = UIImage(named: "gender0")
            case "Female":
                gender.image = UIImage(named: "gender1")
            case "No Preference":
                gender.image = UIImage(named: "No Image Selected")
            case "Apartment":
                housing.image = UIImage(named: "Apartment")
            case "House":
                housing.image = UIImage(named: "Housing")
            case "No Preference":
                housing.image = UIImage(named: "No Image Selected")
            case "Yes":
                smoking.image = UIImage(named: "smoking0")
            case "No":
                smoking.image = UIImage(named: "smoking1")
            case "Pet":
                amen1.image = UIImage(named: "Pet")
            case "Washing Machine":
                amen2.image = UIImage(named: "laundry")
            case "Gym":
                amen3.image = UIImage(named: "gym")
            case "Pool":
                amen4.image = UIImage(named: "pool")
            default:
                break
            }
        }
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
