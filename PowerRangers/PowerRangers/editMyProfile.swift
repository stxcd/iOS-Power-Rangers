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
    
    let imagePickerController = UIImagePickerController()


    
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
        
        //Dismiss the picker.
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func didTapPhotoImageView() {
        
        //Hide the keyboard.
        
        fieldA.resignFirstResponder()
        
        //Only allow photos to be picked, not taken.
        
        self.imagePickerController.sourceType = .PhotoLibrary
        
        //Make sure ViewController is notified when the user picks an image.
        
        self.imagePickerController.delegate = self
        
        presentViewController(self.imagePickerController, animated: true, completion: nil)
    }
    
     //MARK: Actions
    
    @IBAction func btnSubmit(sender: AnyObject) {
        viewMyProfile()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func viewMyProfile() {
        if let vmp = parent {
            vmp.nameLabel.text = fieldA.text
            vmp.locationLabel.text = fieldB.text
            vmp.classLabel.text = fieldC.text
            vmp.numberLabel.text = fieldD.text
            vmp.emailLabel.text = fieldE.text
            vmp.trackLabel.text = fieldF.text
            vmp.roleLabel.text = fieldG.text
            vmp.aboutLabel.text = fieldH.text
            vmp.nxtlocationLabel.text = fieldI.text
            vmp.profPic.image = photoImageView.image
            
            
        }
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