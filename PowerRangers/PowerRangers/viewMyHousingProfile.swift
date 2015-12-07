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
    
    var filterselctions:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if let fs = filterselctions {
            sortFilters(fs)
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
                price.image = UIImage(named: "Price")
            case "$2000":
                price.image = UIImage(named: "Price")
            case "1500":
                price.image = UIImage(named: "Price")
            case "Male":
                gender.image = UIImage(named: "Image-1")
            case "Female":
                gender.image = UIImage(named: "Image-1")
            case "No Preference":
                gender.image = UIImage(named: "Image-1")
            case "Apartment":
                housing.image = UIImage(named: "Smoking")
            case "House":
                housing.image = UIImage(named: "Smoking")
            case "No Preference":
                housing.image = UIImage(named: "")
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
