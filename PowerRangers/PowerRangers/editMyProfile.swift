//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class editMyProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Outlets for textfields. Order is same as on storyboard. EXCEPTION--IMAGE VIEW IS LAST
    @IBOutlet weak var fieldA: UITextField!
    @IBOutlet weak var fieldB: UITextField!
    @IBOutlet weak var fieldC: UITextField!
    @IBOutlet weak var fieldD: UITextField!
    @IBOutlet weak var fieldE: UITextField!
    @IBOutlet weak var fieldF: UITextField!
    @IBOutlet weak var fieldG: UITextField!
    @IBOutlet weak var fieldH: UITextField!
    @IBOutlet weak var fieldI: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
     
        // Dismiss the picker if the user canceled.
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPackingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        
        photoImageView.image = selectedImage
        
        //Dismiss the picker.
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: Actions

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        
        fieldA.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo library.
        
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken.
        
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnSubmit(sender: AnyObject) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "btnSubmitSegue"){
            let svc = segue.destinationViewController as! ViewMyProfile
            svc.dataPassed = fieldA.text
            svc.secondDataPassed = fieldB.text
            svc.thirdDataPassed = fieldC.text
            svc.fourthDataPassed = fieldD.text
            svc.fifthDataPassed = fieldE.text
            svc.sixthDataPassed = fieldF.text
            svc.seventhDataPassed = fieldG.text
            svc.eighthDataPassed = fieldH.text
            svc.nighthnDataPassed = fieldI.text
        }
    }
    
    }