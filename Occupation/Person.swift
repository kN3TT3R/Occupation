//
//  Person.swift
//  Occupation
//
//  Created by Kenneth Debruyn on 8/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation


class Person {
    
    
    // MARK: - Properties
    var name: String
    var jobs: [Job]
    
    
    
    // MARK: - Initializers
    init(name: String, jobs: [Job]) {
        self.name = name
        self.jobs = jobs
    }
    
}
