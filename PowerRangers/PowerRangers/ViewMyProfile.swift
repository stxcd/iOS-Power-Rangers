//
//  ViewController.swift
//  My Profile
//
//  Created by Jason  on 11/23/15.
//  Copyright © 2015 Jason . All rights reserved.
//

import UIKit

class ViewMyProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var nxtlocationLabel: UILabel!
    @IBOutlet weak var profPic: UIImageView!
    
    var filterlabels = [String]()
    var profileValues = [String:String]()
    
    //Passing Data Between View Controllers Through Textfields
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setup() {
     
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getProfileValues()
    }
    
    func getProfileValues() {
        
        let saveProfile = SaveInformation()
        if let dict = saveProfile.getProfile() {
            let profile = Blp(d: dict)
            setProfileValues(profile)
        }
        
        if let name = nameLabel.text, email = emailLabel.text, number = numberLabel.text, location = locationLabel.text, c = classLabel.text {
            profileValues["name"] = name
            profileValues["email"] = email
            profileValues["number"] = number
            profileValues["location"] = location
            profileValues["classlabel"] = c
        }
    }
    
    func setProfileValues(profile:Blp) {
        nameLabel.text = profile.name
        locationLabel.text = profile.location
        classLabel.text = profile.c
        numberLabel.text = profile.phoneNum
        emailLabel.text = profile.email
        trackLabel.text = profile.track
        roleLabel.text = profile.role
        aboutLabel.text = profile.interests
        nxtlocationLabel.text = profile.nextLocation
        if let data = getDataForFile(profile.photo) {
            profPic.image = UIImage(data: data)
        }
    }
    
    func getDataForFile(f:String) -> NSData? {
        if let photoLocation = fileInDocumentsDirectory(profileImageKeyForDocumentsDirectory) {
            do {
                let d = try NSData(contentsOfURL: photoLocation, options: .DataReadingMappedAlways)
                profPic.image = UIImage(data: d)
            } catch {
                print("\(error)")
            }
        }
        return nil
    }
}

extension ViewMyProfile {
    
    //Actions
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let edit = segue.destinationViewController as? editMyProfile {
                edit.parent = self
            }
        if let nav = segue.destinationViewController as? UINavigationController {
            if let viewMyHousing = nav.topViewController as? ViewMyHousingProfile {
                viewMyHousing.profileValues = profileValues
            }
        }
    }
}

