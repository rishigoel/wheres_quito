//
//  Randomizr.swift
//  wheres_quito
//
//  Created by Rishi Goel on 11/16/17.
//  Copyright © 2017 Rishi Goel. All rights reserved.
//

import Foundation

class Randomizr {
    var locationsArray: [String]
    var location: String
    
    init () {
        locationsArray = ["Quito is in Mongolia", "Quito is hiding from you", "Even Quito doesn't know where he is", "Quito is behind you", "Quito is on the moon", "Quito is playing well with others", "Quito is in the walls", "Quito is in your dreams", "Quito has quit and become a traffic cop", "Quito is in the heart of the Congolese jungle", "Quito is trying to find the source code for this app and bring it down", "Quito is done with your shit"]
        location = ""
    }
    
    func getLocation() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(locationsArray.count)))
        return locationsArray[randomIndex]
    }
}
