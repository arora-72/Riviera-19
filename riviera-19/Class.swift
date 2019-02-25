//
//  Class.swift
//  riviera-19
//
//  Created by Indresh Arora on 01/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import Foundation


struct Premium {
    var hasExternals: String
    var fees: String
    var category: String
    var club: String
    var name: String
    var coordinator1: String
    var phone1: String
    var coordinator2: String
    var phone2: String
    var description: String
    
    init(hasExternals: String, fees: String, category: String, club: String, name: String, coordinator1: String, phone1: String, coordinator2:String, phone2: String, description: String) {
        self.category = category
        self.fees = fees
        self.category = category
        self.club = club
        self.name = name
        self.coordinator1 = coordinator1
        self.phone1 = phone1
        self.coordinator2 = coordinator2
        self.phone2 = phone2
        self.description = description
        self.hasExternals = hasExternals
    }
}
