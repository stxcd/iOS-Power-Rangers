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
        viewMyProfile()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func viewMyProfile() {
        if let vmp = parent {
            vmp.dataPassed = fieldA.text
            vmp.secondDataPassed = fieldB.text
            vmp.thirdDataPassed = fieldC.text
            vmp.fourthDataPassed = fieldD.text
            vmp.fifthDataPassed = fieldE.text
            vmp.sixthDataPassed = fieldF.text
            vmp.seventhDataPassed = fieldG.text
            vmp.eighthDataPassed = fieldH.text
            vmp.nighthnDataPassed = fieldI.text
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
}