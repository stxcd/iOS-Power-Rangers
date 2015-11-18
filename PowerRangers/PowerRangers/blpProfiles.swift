//
//  ViewController.swift
//  JSON testing
//
//  Created by Zack on 11/16/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import UIKit

class blpProfiles {
    
        var names = [String]()
        var tracks = [String]()
        var roles = [String]()
        var locations = [String]()
        var interestsDict = [String]()
        var phoneNumbers = [String]()
        var emails = [String]()
        var housingDict = [String]()
        
    func getJSON () {
        
    DataManager.grabNames { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["blps"] as? [[String: AnyObject]] {
                    for blps in blps {
                        // Pulling first and last names and combining into one dictionary
                        if let firstName = blps["firstName"] as? String {
                            if let lastName = blps["lastName"] as? String {
                                self.names.append(firstName + " " + lastName)
                            }
                        }
                        // pulling track info into separate dictionary
                        if let track = blps["track"] as? String {
                            self.tracks.append(track)
                        }
                        // pulling role into separate dictionary
                        if let role = blps["role"] as? String {
                            self.roles.append(role)
                        }
                        //pulling locations into dictionary
                        if let location = blps["location"] as? String {
                            self.locations.append(location)
                        }
                        // pull interests
                        if let interests = blps["interests"] as? String {
                            self.interestsDict.append(interests)
                        }
                        // pull phone
                        if let phoneNum = blps["phoneNum"] as? String {
                            self.phoneNumbers.append(phoneNum)
                        }
                        //pull emails
                        if let email = blps["email"] as? String {
                            self.emails.append(email)
                        }
                        //pull housing
                        if let housing = blps["housing"] as? String {
                            self.housingDict.append(housing)
                        }
                    }
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
            
            print(self.housingDict)
        
        }
        
    
    }
}



