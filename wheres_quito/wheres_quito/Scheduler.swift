//
//  Scheduler.swift
//  wheres_quito
//
//  Created by Rishi Goel on 11/16/17.
//  Copyright © 2017 Rishi Goel. All rights reserved.
//

import Foundation

class Scheduler {
    var scheduleDict2017: [TimeInterval: String]
    var sanFrancisco: String
    var lasVegas: String
    var unknown: String
    var hiding: String
    var mongolia: String
    var vacation: String
    var christmas: String
    var timeStamp2018: TimeInterval
    var date: Date
    
    init() {
        date = Date()
        sanFrancisco = "Quito is in San Francisco"
        lasVegas = "Quito is in Las Vegas"
        unknown = "Quito didn't tell me :("
        hiding = "Quito is hiding from you"
        mongolia = "Quito is in Mongolia"
        vacation = "Quito is on Vacation"
        christmas = "Why you looking for Quito? It's Christmas..."
        timeStamp2018 = 1514764860
        scheduleDict2017 = [1510790460:lasVegas,
                            1511136060:vacation,
                            1512345660:lasVegas,
                            1512950460:sanFrancisco,
                            1513555260:unknown,
                            1514160060: christmas,
                            1514246460: lasVegas]
        
    }
}
