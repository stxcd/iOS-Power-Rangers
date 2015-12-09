//
//  SaveProfile.swift
//  PowerRangers
//
//  Created by Zack on 12/8/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import Foundation

let ProfileKey = "Profile"
let HousingKey = "Housing"

class SaveInformation {
    
    var profileDictionary:[String:NSObject]?
    var housingDicitonary:[String:NSObject]?
    
    let defaults = NSUserDefaults.standardUserDefaults()

    
    func saveProfile(profile:[String:String]) {
        defaults.setObject(profile, forKey: ProfileKey)
        defaults.synchronize()
    }
    
    func saveHousing(housing:[String:String]) {
        defaults.setObject(housing, forKey: HousingKey)
        defaults.synchronize()        
    }
    
    func getProfile() -> [String:String]? {
        if let profile = defaults.objectForKey(ProfileKey) as? [String:String] {
            return profile
        }
        return nil
    }
    
    func getHousing() -> [String:String]? {
        if let housing = defaults.objectForKey(HousingKey) as? [String:String] {
            return housing
        }
        return nil
    }
}