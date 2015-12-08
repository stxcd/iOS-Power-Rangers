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
    
    var newvar: String!
    var newvar2: String!
    var newvar3: String!
    var newvar4: String!
    var newvar5: String!
    var newvar6: String!
    var newvar7: String!
    var newvar8: String!
    var newvar9: String!
    
    var filterlabels = [String]()
    var profileValues = [String:String]()
    
    //Passing Data Between View Controllers Through Textfields
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getProfileValues()
    }
    
    func getProfileValues() {
        
        let saveProfile = SaveProfile()
        if let dict = saveProfile.getProfile() {
            let profile = Blp(d: dict)
            setProfileValues(profile)
        }
        
        if let name = nameLabel.text, email = emailLabel.text, number = numberLabel.text, location = locationLabel.text, c = classLabel.text {
            profileValues["name"] = name
            profileValues["email"] = email
            profileValues["number"] = number
            profileValues["location"] = location
            profileValues["class"] = c
        }
    }
    
    func setProfileValues(profile:Blp) {
        nameLabel.text = profile.name
        locationLabel.text = profile.location
        classLabel.text = profile.identifier
        numberLabel.text = profile.phoneNum
        emailLabel.text = profile.email
        trackLabel.text = profile.track
        roleLabel.text = profile.role
        aboutLabel.text = profile.interests
        nxtlocationLabel.text = profile.nextLocation
    }
    
    //println(newvar)
    //println(newvar2)
    
    //UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profPic.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewMyProfile {
    
    //Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
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

