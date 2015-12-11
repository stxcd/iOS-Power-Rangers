//
//  blpHousingViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/30/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpHousingViewController: UIViewController {

    @IBOutlet var helpView: UIView!
let blpHousingArrayManager = BlpHousingArrayManager()
    
//    var blp: BlpHousing?
    var blp:BlpUser?
    var ident : Int = 0
    
    @IBOutlet weak var amenityRight: UILabel!
    
    @IBOutlet weak var amenityLeft: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var blpImage: UIImageView!
    
    @IBOutlet weak var priceImage: UIImageView!
    
    @IBOutlet weak var smokingImage: UIImageView!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var gymImage: UIImageView!
    
    @IBOutlet weak var poolImage: UIImageView!
    
    @IBOutlet weak var parkingImage: UIImageView!
    
    @IBOutlet weak var laundryImage: UIImageView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var typeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfile()
       // setLabels()
//        print(self.blpHousingArrayManager.array)
    }
    
    func setupProfile() {
        
        let infoButton = UIButton(type: .InfoDark)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
        
        infoButton.addTarget(self, action: "showHousingHelp", forControlEvents: .TouchUpInside)
        
        if let profile = blp {
            getHousing(profile.firstName)
            fullNameLabel.text = profile.firstName
            locationLabel.text = profile.location
            classLabel.text = profile.role
            phoneLabel.text = profile.phoneNum
            emailLabel.text = profile.email
        }
    }
    
    func showHousingHelp () {
        self.helpView.alpha = 0
        self.view.addSubview(self.helpView)
        UIView.animateWithDuration(1) { () -> Void in
            self.helpView.alpha = 1
            self.helpView.frame = CGRectMake(0, 75, self.view.frame.width, self.helpView.frame.height)
            
        }
    }
    
    @IBAction func dismissHousing(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.helpView.frame = CGRectMake(0, -self.helpView.frame.height, self.view.frame.width, self.helpView.frame.height)
            self.helpView.alpha = 0
            }) { (success) -> Void in
                self.helpView.removeFromSuperview()
        }
    }
    
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLabels (housingProf:HousingUser) {
        
        fullNameLabel.text = "\(housingProf.firstName), \(housingProf.lastName)"
    
        
        let useName = housingProf.lastName
        let blpPic = UIImage(named: useName)
        blpImage.image = blpPic
        
        //pull correct price image
        let pricePull = housingProf.priceRange
        let priceString = "price"+pricePull
        let pricePic = UIImage(named: priceString)
        priceImage.image = pricePic
        
        //pull correct smoking image
        let smokingPull = housingProf.smoking
        let smokingString = "smoking"+smokingPull
        let smokingPic = UIImage(named: smokingString)
        smokingImage.image = smokingPic
        
        var gymCheck : Bool = false
        //pull correct gym image
        let gymPull = housingProf.gym
        if gymPull == "1" {
            let gymPic = UIImage(named: "gym")
            gymImage.image = gymPic
            gymCheck = true
        } else {
            gymImage.hidden = true
        }
        
        var poolCheck : Bool = false
    
        //pull correct pool image
        let poolPull = housingProf.pool
        if poolPull == "1" {
            let poolPic = UIImage(named: "pool")
            poolImage.image = poolPic
            poolCheck = true
        } else {
            poolImage.hidden = true
        }
        
        //pull gender
        let genderPull = housingProf.roommateGender
        let genderString = "gender"+genderPull
        let genderPic = UIImage(named: genderString)
        genderImage.image = genderPic
        
        let typePull = housingProf.typeOfResidence
        if typePull == "1" {
            typeImage.image = UIImage(named: "Apartment")
        } else {
            typeImage.image = UIImage(named: "Housing")
        }
        
        
        var laundryCheck : Bool = false
        //pull correct laundry image
        let laundryPull = housingProf.laundry
        if laundryPull == "1" {
            let laundryPic = UIImage(named: "laundry")
            laundryImage.image = laundryPic
            laundryCheck = true
        } else {
            laundryImage.hidden = true
        }
        
        var parkingCheck : Bool = false

        //pull correct parking image
        let parkingPull = housingProf.parking
        if parkingPull == "1" {
            let parkingPic = UIImage(named: "parking")
            parkingImage.image = parkingPic
            parkingCheck = true
        } else {
            parkingImage.hidden = true
        }
    
        if gymCheck && parkingCheck {
            amenityRight.hidden = true
        } else if laundryCheck && poolCheck {
            amenityRight.hidden = true
        } else {
            amenityLeft.hidden = true
        }
        
    }
    
    func reloadDataOnTheMainThread() {
        dispatch_async(dispatch_get_main_queue()) {
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension BlpHousingViewController {
    
    func getHousing(firstName:String) {
        
        DataManager.getBlpHousingUserFromParse(firstName) { (profiles) -> Void in
            if profiles != nil {
                for profile in profiles! {
                    if let housingUser = profile as? HousingUser {
                        self.setLabels(housingUser)
                    }
                }
                
                self.reloadDataOnTheMainThread()
            }else {
                // nil profiles
            }
        }
        
//        DataManager.getHousing { (data) -> Void in
//            do {
//                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
//                
//                if let blps = json["housing"] as? [[String: AnyObject]] {
//                    for blps in blps {
//                        let profile = BlpHousing(d: blps)
//                        self.blpHousingArrayManager.setBlp(profile)
//                    }
//                }
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    self.setLabels()
//                })
//                
//            } catch {
//                print("error serializing JSON: \(error)")
//            }
//            
//        }
        
    }
}


