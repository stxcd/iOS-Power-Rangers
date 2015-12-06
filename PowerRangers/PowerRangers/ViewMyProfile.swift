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
    
    var dataPassed:String!
    var secondDataPassed:String!
    var thirdDataPassed:String!
    var fourthDataPassed:String!
    var fifthDataPassed:String!
    var sixthDataPassed:String!
    var seventhDataPassed:String!
    var eighthDataPassed:String!
    var nighthnDataPassed:String!
    var newvar: String!
    var newvar2: String!
    var newvar3: String!
    var newvar4: String!
    var newvar5: String!
    var newvar6: String!
    var newvar7: String!
    var newvar8: String!
    var newvar9: String!
    
    //Passing Data Between View Controllers Through Textfields
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = dataPassed
        locationLabel.text = secondDataPassed
        classLabel.text = thirdDataPassed
        numberLabel.text = fourthDataPassed
        emailLabel.text = fifthDataPassed
        trackLabel.text = sixthDataPassed
        roleLabel.text = seventhDataPassed
        aboutLabel.text = eighthDataPassed
        nxtlocationLabel.text = nighthnDataPassed
        // Do any additional setup after loading the view, typically from a nib.
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
    
}
