//
//  blpHousing.swift
//  PowerRangers
//
//  Created by Zack on 11/30/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit
import Parse

class HousingUser: PFObject, PFSubclassing {
    
    //MARK: Properties
    
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var priceRange: String
    @NSManaged var pets: String
    @NSManaged var smoking: String
    @NSManaged var pool: String
    @NSManaged var gym: String
    @NSManaged var parking: String
    @NSManaged var laundry: String
    @NSManaged var numRoommates: String
    @NSManaged var distanceToWork: String
    @NSManaged var roommateGender: String
    @NSManaged var typeOfResidence: String
    
    static func parseClassName() -> String {
        return "HousingUser"
    }
    
    //MARK: Initialization
    
//    init(d:[String: AnyObject]) {
//        
//        self.firstName = d["firstName"] as? String ?? ""
//        self.lastName = d["lastName"] as? String ?? ""
//        self.priceRange = d["priceRange"] as? String ?? ""
//        self.pets = d["pets"] as? String ?? ""
//        self.smoking = d["smoking"] as? String ?? ""
//        self.pool = d["pool"] as? String ?? ""
//        self.gym = d["gym"] as? String ?? ""
//        self.parking = d["parking"] as? String ?? ""
//        self.laundry = d["laundry"] as? String ?? ""
//        self.numRoommates = d["numRoommates"] as? String ?? ""
//        self.distanceToWork = d["distanceToWork"] as? String ?? ""
//        self.roommateGender = d["roommateGender"] as? String ?? ""
//        self.typeOfResidence = d["typeOfResidence"] as? String ?? ""
//        
//    }
}
