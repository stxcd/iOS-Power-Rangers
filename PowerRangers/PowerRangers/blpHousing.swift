//
//  blpHousing.swift
//  PowerRangers
//
//  Created by Zack on 11/30/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpHousing {
    
    //MARK: Properties
    
    var firstName: String
    var lastName: String
    var priceRange: String
    var pets: String
    var smoking: String
    var pool: String
    var gym: String
    var parking: String
    var laundry: String
    var numRoommates: String
    var distanceToWork: String
    var roommateGender: String
    var typeOfResidence: String
    
    //MARK: Initialization
    
    init(d:[String: AnyObject]) {
        
        self.firstName = d["firstName"] as? String ?? ""
        self.lastName = d["lastName"] as? String ?? ""
        self.priceRange = d["priceRange"] as? String ?? ""
        self.pets = d["pets"] as? String ?? ""
        self.smoking = d["smoking"] as? String ?? ""
        self.pool = d["pool"] as? String ?? ""
        self.gym = d["gym"] as? String ?? ""
        self.parking = d["parking"] as? String ?? ""
        self.laundry = d["laundry"] as? String ?? ""
        self.numRoommates = d["numRoommates"] as? String ?? ""
        self.distanceToWork = d["distanceToWork"] as? String ?? ""
        self.roommateGender = d["roommateGender"] as? String ?? ""
        self.typeOfResidence = d["typeOfResidence"] as? String ?? ""
        
    }
}
