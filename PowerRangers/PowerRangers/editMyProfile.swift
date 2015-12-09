//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

let profileImageKeyForDocumentsDirectory = "profileImage.png"

func getDocumentsURL() -> NSURL? {
    if let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last {
        return url
    }
    return nil
}

func fileInDocumentsDirectory(fn:String) -> NSURL? {
    if let url = getDocumentsURL() {
        return url.URLByAppendingPathComponent(fn)
    }
    return nil
}

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

    @IBOutlet weak var photoImageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    var selectedImage:UIImage?

    
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
        
        let tap = UITapGestureRecognizer(target: self, action: "didTapPhotoImageView")
        tap.numberOfTapsRequired = 1
        photoImageView.addGestureRecognizer(tap)
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
         //Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
         //The info dictionary contains multiple representations of the image, and this uses the original.
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        
        photoImageView.image = selectedImage
        self.selectedImage = selectedImage
        
        //Dismiss the picker.
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func didTapPhotoImageView() {
        
        //Hide the keyboard.
        
        nameTextField.resignFirstResponder()
        
        //Only allow photos to be picked, not taken.
        
        self.imagePickerController.sourceType = .PhotoLibrary
        
        //Make sure ViewController is notified when the user picks an image.
        
        self.imagePickerController.delegate = self
        
        presentViewController(self.imagePickerController, animated: true, completion: nil)
    }
    
     //MARK: Actions
    
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

    func validForm() -> Bool {
        if let name = nameTextField.text, track = tTextField.text, phone = phoneNumberTextField.text, email = emailTextField.text, rotation = rotationTitleTextField.text, aboutme = aboutMeTextField.text, loc = locTextField.text, next = nextLocTextField.text, c = classTextField.text {
            if name == "" || track == "" || phone == "" || email == "" || rotation == "" || aboutme == "" || c == ""{
                
            }else {
                if let photoLocation = fileInDocumentsDirectory(profileImageKeyForDocumentsDirectory) {
                    print(photoLocation)
                    let profileDict = ["firstName": name,"track":track,"phoneNum":phone,"email":email,"role":rotation,"interests":aboutme,"location":loc, "nextLocation":next, "housing":"NO", "photo":photoLocation.path!, "class":c]
                    if saveImage(photoLocation) {
                        saveProfile(profileDict)
                        return true
                    }
                }
            }
        }
        return false
    }

    func saveImage(path:NSURL) -> Bool {
        
        var result = false
        
        if let image = selectedImage {
            let imageData = UIImagePNGRepresentation(image)
            if imageData!.writeToURL(path, atomically: true) {
                result = true
            }
        }
        
        return result
    }
    
    func loadImageFromPath(path:String) -> UIImage? {
        if let image = UIImage(contentsOfFile: path) {
            return image
        }
        return nil
    }
    
    func saveProfile(d:[String:String]) {
        let saveProfile = SaveProfile()
        saveProfile.saveProfile(d)
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