//
//  BlpArrayManager.swift
//  PowerRangers
//
//  Created by Trace Pomplun on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import Foundation
import Parse

class BlpArrayManager {
    
    var array = [BlpUser]()
//    var array:[Blp] {
//        return a
//    }
    
    func setBlp(blp:BlpUser) {
        array.append(blp)
    }
    
}