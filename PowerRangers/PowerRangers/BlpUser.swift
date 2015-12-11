//
//  blp.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit
import Parse

class BlpUser:PFObject, PFSubclassing {
    
    //MARK: Properties
    
    @NSManaged var firstName: String
    @NSManaged var location: String
    @NSManaged var track: String
    @NSManaged var phoneNum: String
    @NSManaged var email: String
    @NSManaged var role: String
    @NSManaged var interests: String
    @NSManaged var housing: String
    @NSManaged var photo: String
    @NSManaged var lastName: String
    @NSManaged var identifier: String
    @NSManaged var nextLocation: String
    @NSManaged var c:String
    
    
    static func parseClassName() -> String {
        return "BlpUser"
    }
    
    //MARK: Initialization
    
//    init(d:[String:AnyObject]) {
//        self.name = d["firstName"] as? String ?? ""
//        self.lastName = d["lastName"] as? String ?? ""
//        self.track = d["track"] as? String ?? ""
//        self.role = d["role"] as? String ?? ""
//        self.location = d["location"] as? String ?? ""
//        self.interests = d["interests"] as? String ?? ""
//        self.phoneNum = d["phoneNum"] as? String ?? ""
//        self.email = d["email"] as? String ?? ""
//        self.housing = d["housing"] as? String ?? ""
//        self.photo = d["photo"] as? String ?? ""
//        self.lastName = d["lastName"] as? String ?? ""
//        self.identifier = d["identifier"] as? String ?? ""
//        self.nextLocation = d["nextLocation"] as? String ?? ""
//        self.c = d["class"] as? String ?? ""
//    }
}
