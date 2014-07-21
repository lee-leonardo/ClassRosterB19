//
//  Person.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class Person {
	var firstName : String
	var lastName : String
	var image : UIImage?
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
		
	}
	
	func fullName() -> String {
		return self.firstName + self.lastName
	}
	func assignImage(imageName: String) {
		image = UIImage(named: imageName)
	}
	
}