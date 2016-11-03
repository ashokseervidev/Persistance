//
//  Person.swift
//  Persistence
//
//  Created by Ashok on 10/30/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.firstName, forKey: "firstName")
        aCoder.encode(self.lastName, forKey: "lastName")
        aCoder.encode(self.age, forKey: "age")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.age = aDecoder.decodeInteger(forKey: "age")
    }
    
    override var description: String {
        return "\(self.firstName) \(self.lastName) \(self.age) \n"
    }
}
    
