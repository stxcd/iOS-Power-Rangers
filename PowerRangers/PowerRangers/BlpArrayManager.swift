//
//  BlpArrayManager.swift
//  PowerRangers
//
//  Created by Trace Pomplun on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import Foundation


class BlpArrayManager {
    
    private var a = [Blp]()
    var array:[Blp] {
        return a
    }
    
    func setBlp(blp:Blp) {
        a.append(blp)
    }
    
}