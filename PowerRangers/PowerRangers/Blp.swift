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
    
    let name: String
    let location: String
    var track: String
    var phoneNum: String
    var email: String
    var role: String
    var interests: String
    var housing: String
    var photo: String
    var lastName: String
    var identifier: String
    var nextLocation: String
    
    //MARK: Initialization
    
    init(d:[String:AnyObject]) {
        self.name = d["firstName"] as? String ?? ""
        self.lastName = d["lastName"] as? String ?? ""
        self.track = d["track"] as? String ?? ""
        self.role = d["role"] as? String ?? ""
        self.location = d["location"] as? String ?? ""
        self.interests = d["interests"] as? String ?? ""
        self.phoneNum = d["phoneNum"] as? String ?? ""
        self.email = d["email"] as? String ?? ""
        self.housing = d["housing"] as? String ?? ""
        self.photo = d["photo"] as? String ?? ""
        self.lastName = d["lastName"] as? String ?? ""
        self.identifier = d["identifier"] as? String ?? ""
        self.nextLocation = d["location"] as? String ?? ""
    }
}
