//
//  SecondViewController.swift
//  PowerRangers
//
//  Created by Tommy on 11/9/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class viewSpecificBlp: UIViewController {
    
    var blp: Blp?
    
    var housingArray = [BlpHousing]()
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var roleLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var interestsLabel: UILabel!
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func viewDidLoad() {
        
        //load profile from JSON (BlpTableViewController)
        
        if let blp = blp {
            fullNameLabel.text = blp.name
            emailLabel.text = blp.email
            phoneLabel.text = blp.phoneNum
            trackLabel.text = blp.track
            roleLabel.text = blp.role
            classLabel.text = blp.track
            locationLabel.text = blp.location
            interestsLabel.text = blp.interests
            
            
            //image pull
            
            let useName = blp.lastName
            let blpImage = UIImage(named: useName)
            
            photoView.image = blpImage
            
            
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var firstNameArr = [String]()
        var lastNameArr = [String]()
        var priceRangeArr = [String]()
        var petsArr = [String]()
        var smokingArr = [String]()
        var poolArr = [String]()
        var gymArr = [String]()
        var parkingArr = [String]()
        var laundryArr = [String]()
        var numRoommatesArr = [String]()
        var distanceToWorkArr = [String]()
        var genderArr = [String]()
        var residenceArr = [String]()
        
        func popHousing(fName: [String], lName: [String], price: [String], pet: [String], smoke: [String], pool: [String], gym: [String], park: [String], laundry: [String], roommate: [String], distance: [String], gender: [String], residence: [String]){
            var i = 0
            var arrCount = fName.count
            while i < arrCount {
                var newHousing = BlpHousing(firstName: fName[i], lastName: lName[i], priceRange: price[i], pets: pet[i], smoking: smoke[i], pool: pool[i], gym: gym[i], parking: park[i], laundry: laundry[i], numRoommates: roommate[i], distanceToWork: distance[i], gender: gender[i], residence: residence[i])!
                housingArray += [newHousing]
                ++i
                
            }
        }
        
        DataManager.grabHousing { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["housing"] as? [[String: AnyObject]] {
                    for blps in blps {
                        // Pulling first and last names and combining into one dictionary
                        if let firstName = blps["firstName"] as? String {
                            firstNameArr.append(firstName)
                        }
                        // pulling track info into separate dictionary
                        if let lastName = blps["lastName"] as? String {
                            lastNameArr.append(lastName)
                        }
                        // pulling role into separate dictionary
                        if let priceRange = blps["priceRange"] as? String {
                            priceRangeArr.append(priceRange)
                        }
                        //pulling locations into dictionary
                        if let pets = blps["pets"] as? String {
                            petsArr.append(pets)
                        }
                        // pull interests
                        if let smoking = blps["smoking"] as? String {
                            smokingArr.append(smoking)
                        }
                        // pull phone
                        if let pool = blps["pool"] as? String {
                            poolArr.append(pool)
                        }
                        //pull emails
                        if let gym = blps["gym"] as? String {
                            gymArr.append(gym)
                        }
                        //pull housing
                        if let parking = blps["parking"] as? String {
                            parkingArr.append(parking)
                        }
                        //pull photo dict
                        if let laundry = blps["laundry"] as? String {
                            laundryArr.append(laundry)
                        }
                        //last Name only
                        if let numRoommates = blps["numRoomates"] as? String {
                            numRoommatesArr.append(numRoommates)
                        }
                        if let distance = blps["distanceToWork"] as? String {
                            distanceToWorkArr.append(distance)
                        }
                        if let gender = blps["roommateGender"] as? String {
                            genderArr.append(gender)
                        }
                        if let residence = blps["typeOfResidence"] as? String {
                            residenceArr.append(residence)
                        }
                    }
                    popHousing(firstNameArr, lName: lastNameArr, price: priceRangeArr, pet: petsArr, smoke: smokingArr, pool: poolArr, gym: gymArr, park: parkingArr, laundry: laundryArr, roommate: numRoommatesArr, distance: distanceToWorkArr, gender: genderArr, residence: residenceArr)
                    
                }
            } catch {
                print("error serializing JSON: \(error)")
            }

    }
    }
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHousing" {
            let blpHousingViewController = segue.destinationViewController as! BlpHousingViewController
            
            //get the cell that generates segue
            
                let specBlp = blp?.identifier
                let path = Int(specBlp!)
                let selectedBlp = housingArray[path!]
                blpHousingViewController.blp = selectedBlp
            
        } 
    }

}

