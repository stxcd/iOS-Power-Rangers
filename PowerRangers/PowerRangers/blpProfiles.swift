//
//  ViewController.swift
//  JSON testing
//
//  Created by Zack on 11/16/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import UIKit

import UIKit

// BLP JSON pull for the tableviewcontroller

class blpProfiles: UITableViewController {
    
    override func viewDidLoad() {
        
        
        var names = [String]()
        var tracks = [String]()
        var roles = [String]()
        var locations = [String]()
        var interestsDict = [String]()
        var phoneNumbers = [String]()
        var emails = [String]()
        var housingDict = [String]()
        
        DataManager.grabNames { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["blps"] as? [[String: AnyObject]] {
                    for blps in blps {
                        // Pulling first and last names and combining into one dictionary
                        if let firstName = blps["firstName"] as? String {
                            if let lastName = blps["lastName"] as? String {
                                names.append(firstName + " " + lastName)
                            }
                        }
                        // pulling track info into separate dictionary
                        if let track = blps["track"] as? String {
                            tracks.append(track)
                        }
                        // pulling role into separate dictionary
                        if let role = blps["role"] as? String {
                            roles.append(role)
                        }
                        //pulling locations into dictionary
                        if let location = blps["location"] as? String {
                            locations.append(location)
                        }
                        // pull interests
                        if let interests = blps["interests"] as? String {
                            interestsDict.append(interests)
                        }
                        // pull phone
                        if let phoneNum = blps["phoneNum"] as? String {
                            phoneNumbers.append(phoneNum)
                        }
                        //pull emails
                        if let email = blps["email"] as? String {
                            emails.append(email)
                        }
                        //pull housing
                        if let housing = blps["housing"] as? String {
                            housingDict.append(housing)
                        }
                    }
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
            
            print(housingDict)
            
        }
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



