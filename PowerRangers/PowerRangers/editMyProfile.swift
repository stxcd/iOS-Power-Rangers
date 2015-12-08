//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class editMyProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //Outlets for textfields. Order is same as on storyboard. EXCEPTION--IMAGE VIEW IS LAST
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var tTextField: UITextField!
    @IBOutlet weak var rotationTitleTextField: UITextField!
    @IBOutlet weak var aboutMeTextField: UITextField!
    @IBOutlet weak var nextLocTextField: UITextField!
    
    
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

    @IBOutlet var pickerViewContainer: PickerViewContainer!
    private var selectedTextField:UITextField?
    weak var parent:ViewMyProfile?
    
    // Text field dictionary
    
    let locationTextField = 1
    let trackTextField = 5
    let nextLocationTextField = 8

    
    var itemSelected: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        pickerViewContainer.setup()
        pickerViewContainer.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        switch textField.tag {
        case locationTextField:
            setupPicker(textField)
            return false
        case trackTextField:
            setupPicker(textField)
            return false
        case nextLocationTextField:
            setupPicker(textField)
            return false
        default:
            return true
        }
    }
    
    func setupPicker(tf:UITextField) {
        selectedTextField = tf
        pickerViewContainer.pickerViewForIndex(tf.tag)
        showPickerViewContainer()
    }
    
    func showPickerViewContainer() {
        pickerViewContainer.alpha = 0
        
        let pickerViewContainerHeight = pickerViewContainer.frame.height
        
        UIView.animateWithDuration(0.5) {
            self.pickerViewContainer.alpha = 1
            self.pickerViewContainer.frame = CGRectMake(0, 64, self.view.frame.width, pickerViewContainerHeight)
            self.view.addSubview(self.pickerViewContainer)
        }
    }
    
    func hidePickerViewContainer() {
        let pickerViewHeight = self.pickerViewContainer.frame.height
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.pickerViewContainer.frame = CGRectMake(0, -pickerViewHeight, self.view.bounds.width, self.pickerViewContainer.bounds.height)
            self.pickerViewContainer.alpha = 0
            }) { (success) -> Void in
                self.pickerViewContainer.removeFromSuperview()
        }
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
        if validForm() {
            navigationController?.popToRootViewControllerAnimated(true)
        }else {
            presentViewController(presentErrorMessage(), animated: true, completion: nil)
        }
    }
    
    func presentErrorMessage() -> UIAlertController {
        let alert = UIAlertController(title: "Invalid Form", message: "One of your profile fields is empty, please completely fill out your profile before saving", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        return alert
    }
    
    /*
    let name: String
    let location: String
    var track: String
    var phoneNum: String
    var email: String
    var role: String
    var interests: String
    var housing: String
    var photo: String
    var lastName: String
    var identifier: String
    var nextLocation: String
    */
    
    func validForm() -> Bool {
        if let name = nameTextField.text, track = tTextField.text, phone = phoneNumberTextField.text, email = emailTextField.text, rotation = rotationTitleTextField.text, aboutme = aboutMeTextField.text {
            if name == "" || track == "" || phone == "" || email == "" || rotation == "" || aboutme == "" {
                
            }else {
                let profileDict = ["firstName": name,"track":track,"phoneNum":phone,"email":email,"role":rotation,"interests":aboutme,"housing":"NO", "photo":"TODO"]
                saveProfile(profileDict)
                return true
            }
        }
        return false
    }
    
    func saveProfile(d:[String:String]) {
//        if let vmp = parent {
            let saveProfile = SaveProfile()
            saveProfile.saveProfile(d)
            
//            vmp.nameLabel.text = nameTextField.text
//            vmp.locationLabel.text = fieldB.text
//            vmp.classLabel.text = fieldC.text
//            vmp.numberLabel.text = fieldD.text
//            vmp.emailLabel.text = fieldE.text
//            vmp.trackLabel.text = tTextField.text
//            vmp.roleLabel.text = fieldG.text
//            vmp.aboutLabel.text = fieldH.text
//            vmp.nxtlocationLabel.text = fieldI.text
//        }
    }
}

extension editMyProfile:DismissPickerView {
    func dismissPickerView(s:String) {
        if let currentTF = selectedTextField {
            currentTF.text = s
        }
        hidePickerViewContainer()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
}