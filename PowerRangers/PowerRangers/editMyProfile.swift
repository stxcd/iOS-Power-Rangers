//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class editMyProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    @IBOutlet weak var location1Picker: UIPickerView!
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var location2Picker: UIPickerView!
    
    
    var result = 0
    
    // Text field dictionary
    
    var selectedIndex = 0
    let locationTextField = 1
    let trackTextField = 5
    let nextLocationTextField = 8
    
    
    let pickerArrays = [0:["Alpharetta", "Atlanta", "Canton", "Charlotte", "Chicago", "Costa Mesa", "Kettering", "St. Paul", "Stamford"], 2:["Audit, Data Analytics, Finance, HR, IT, Marketing, Operations, Risk, Sales"]]
    
    let locations = ["Alpharetta", "Atlanta", "Canton", "Charlotte", "Chicago", "Costa Mesa", "Kettering", "St. Paul", "Stamford"]
    let tracks = ["Audit, Data Analytics, Finance, HR, IT, Marketing, Operations, Risk, Sales"]
    
    let textfieldDictionary = [0: "Name",
        1: ["Alpharetta", "Atlanta", "Canton", "Charlotte", "Chicago", "Costa Mesa", "Kettering", "St. Paul", "Stamford"],
        2: "Class",
        3: "Phone Nubmber",
        4: "Email",
        5: "Track",
        6: "Rotation Title",
        7: "About Me",
        8: "Next Location"
    ]
    
    
    var itemSelected: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location1Picker.hidden = true
        location2Picker.hidden = true
        trackPicker.hidden = true
//        fieldB.text = locations[0]
//        fieldF.text = tracks[0]
//        fieldI.text = locations2[0]
        
        location1Picker.delegate = self
        location1Picker.dataSource = self
        location2Picker.delegate = self
        location2Picker.dataSource = self
        fieldB.delegate = self
        fieldF.delegate = self
        fieldI.delegate = self
        trackPicker.delegate = self
        trackPicker.dataSource = self
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    
    }
    
    //MARK: UIPickerViewLocation1
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {

        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == location1Picker {
            print(pickerArrays[0]!.count)
            return pickerArrays[0]!.count
        
        } else if pickerView == location2Picker {
            
            return pickerArrays[0]!.count
            
        }
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if row > pickerArrays[selectedIndex]?.count {
            return ""
        }
        
        if pickerView == location1Picker {
//            let a = pickerArrays[selectedIndex]
//            print(row)
//            print(a![row])
            print(locations[row])
            return locations[row]
        } else if pickerView == location2Picker {
            return locations[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        switch selectedIndex {
        case locationTextField:
            fieldB.text = pickerArrays[selectedIndex]![row]
            location1Picker.hidden = true
        case trackTextField:
            fieldF.text = pickerArrays[selectedIndex]![row]
            trackPicker.hidden = true
        case nextLocationTextField:
            fieldI.text = pickerArrays[selectedIndex]![row]
            location2Picker.hidden = true
        default:
            break
        }
        
    }
    
    func textFieldShouldBeginEditing(fieldB: UITextField) -> Bool {
        
        selectedIndex = fieldB.tag
        
        switch fieldB.tag {
        case locationTextField:
            location1Picker.hidden = false
            return false
        case trackTextField:
            trackPicker.hidden = false
            return false
        case nextLocationTextField:
            location2Picker.hidden = false
            return false
        default:
            return true
        }
    }
    
    func maptoValue() {
        let value = textfieldDictionary[selectedIndex]
        print(value)
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