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
    var gender: String
    var residence: String
    
    //MARK: Initialization
    
    init? (firstName: String, lastName: String, priceRange: String, pets: String, smoking: String, pool: String, gym: String, parking: String, laundry: String, numRoommates: String, distanceToWork: String, gender: String, residence: String) {
        
        //Initialize stored values
        
        self.firstName = firstName
        self.lastName = lastName
        self.priceRange = priceRange
        self.pets = pets
        self.smoking = smoking
        self.pool = pool
        self.gym = gym
        self.parking = parking
        self.laundry = laundry
        self.numRoommates = numRoommates
        self.distanceToWork = distanceToWork
        self.gender = gender
        self.residence = residence
        
        
        //initalizer to check if there is no name or rating is negative
        
        
    }
}
