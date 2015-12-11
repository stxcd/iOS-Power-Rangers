//
//  viewMyHousingProfile.swift
//  PowerRangers
//
//  Created by Zack on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class ViewMyHousingProfile: UIViewController {
    
    //Here's the Properties
    
    @IBOutlet weak var price: UIImageView!
    @IBOutlet weak var smoking: UIImageView!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var housing: UIImageView!
    @IBOutlet weak var amen1: UIImageView!
    @IBOutlet weak var amen2: UIImageView!
    @IBOutlet weak var amen3: UIImageView!
    @IBOutlet weak var amen4: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var classlabel: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var filterselctions:[String]?
    var filterlabels:[String]?
    
    var profileValues:[String:String]?
    
    var housingProfileDictionary = [String:String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
//    private func createEntry() -> UIView {
//        
//        let stack = UIStackView()
//        stack.axis = .Horizontal
//        stack.alignment = .FirstBaseline
//        stack.distribution = .FillProportionally
//        stack.addArrangedSubview(amen1)
//        stack.addArrangedSubview(amen2)
//        stack.addArrangedSubview(amen3)
//        stack.addArrangedSubview(amen4)
//        
//        return stack
//        
//    }
    
    
    func validForm() {
        if let name = name.text, email = email.text, location = location.text, classLabel = classlabel.text,  phone = number.text {
            let housingDict = ["name": name, "email": email, "location": location, "classLabel": classLabel, "phone":phone]
            saveProfile(housingDict)
        }
        
    }
    
    func saveProfile(d:[String:String]) {
        let saveProfile = SaveInformation()
        saveProfile.saveHousing(d)
    }
    
    func presentErrorMessage() -> UIAlertController {
        let alert = UIAlertController(title: "Invalid Form", message: "One of your profile fields is empty, please completely fill out your profile before saving", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        return alert
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if let fs = filterselctions {
            handleFilters(fs)
        }
        setProfileValues()
        checkForHousingProfile()
    }
    
    func checkForHousingProfile() {
        let save = SaveInformation()
        if let dict = save.getHousing() {
            filterOutKeys(dict)
        }
    }
    
    func filterOutKeys(dict:[String:String]) {
        
        var filters = [String]()
        
        for (k,_) in dict {
            filters.append(k)
        }
        
        filterselctions = filters
        handleFilters(filterselctions!)
    }
    
    func setProfileValues() {
        if let pValues = profileValues {
            for (k,v) in pValues {
                switch k {
                case "name":
                    name.text = v
                case "email":
                    email.text = v
                case "location":
                    location.text  = v
                case "classlabel":
                    classlabel.text = v
                case "number":
                    number.text = v
                default:
                    break
                }
            }
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? editMyHousing {
            destination.parent = self
        }
    }
    
    func buildHousingDictionary(k:String, v:String) {
        housingProfileDictionary[k] = v
    }
    
    func saveHousingProfile() {
        let save = SaveInformation()
        save.saveHousing(housingProfileDictionary)
    }
    
    func handleFilters(filters:[String]) {
        for filters in filters {
            switch filters {
            case "$1000":
                buildHousingDictionary("$1000", v: "price1")
                price.image = UIImage(named: "price1")
            case "$1500":
                buildHousingDictionary("$1500", v: "price2")
                price.image = UIImage(named: "price2")
            case "$2000":
                buildHousingDictionary("2000", v: "price3")
                price.image = UIImage(named: "price3")
            case "Male":
                buildHousingDictionary("Male", v: "gender0")
                gender.image = UIImage(named: "gender0")
            case "Female":
                buildHousingDictionary("Female", v: "gender1")
                gender.image = UIImage(named: "gender1")
            case "No Preference":
                buildHousingDictionary("No Preference", v: "No Image Selected")
                gender.image = UIImage(named: "No Image Selected")
            case "Apartment":
                buildHousingDictionary("Apartment", v: "Apartment")
                housing.image = UIImage(named: "Apartment")
            case "House":
                buildHousingDictionary("House", v: "House")
                housing.image = UIImage(named: "Housing")
            case "No Preference":
                buildHousingDictionary("No Preference", v: "No Image Selected")
                housing.image = UIImage(named: "No Image Selected")
            case "Yes":
                buildHousingDictionary("Yes", v: "smoking0")
                smoking.image = UIImage(named: "smoking0")
            case "No":
                buildHousingDictionary("No", v: "smoking1")
                smoking.image = UIImage(named: "smoking1")
            case "Pet":
                buildHousingDictionary("Pet", v: "Pet")
                amen1.image = UIImage(named: "Pet")
            case "Washing Machine":
                buildHousingDictionary("Washing Machine", v: "laundry")
                amen2.image = UIImage(named: "laundry")
            case "Gym":
                buildHousingDictionary("Gym", v: "gym")
                amen3.image = UIImage(named: "gym")
            case "Pool":
                buildHousingDictionary("Pool", v: "pool")
                amen4.image = UIImage(named: "pool")
            default:
                break
            }
        }
        saveHousingProfile()
    }
}


/*
IBActions
*/

extension ViewMyHousingProfile {
    
    @IBAction func dismissHousingProfile(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
