//
//  blp.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class Blp {
    
    //MARK: Properties
    
    var name: String
    var location: String
    var track: String
    var phoneNum: String
    var email: String
    var role: String
    var interests: String
    var housing: String
    
    //MARK: Initialization
    
    init? (name:String, location: String, track: String, phoneNum: String, email: String, role: String, interests: String, housing: String) {
        
        //Initialize stored values
        
        self.name = name
        self.location = location
        self.track = track
        self.phoneNum = phoneNum
        self.email = email
        self.role = role
        self.interests = interests
        self.housing = housing
        //initalizer to check if there is no name or rating is negative
        
        
    }
}
