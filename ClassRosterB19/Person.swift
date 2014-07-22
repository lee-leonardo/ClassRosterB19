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
	func assignImage(imageName: String = "lamb") {
		image = UIImage(named: imageName)
	}
	func assignImageTest(imageName: String = "lamb") -> UIImage {
		return UIImage(named: imageName)
	}
	
	//Factory
	//	Attributed to Kirby Shabaga, explanation by John Clem.
	class func loadRosterFromPlist() -> Array<Person> {
		//For the challenge.
		var roster = [Person]()
		
		let filePath = NSBundle.mainBundle().pathForResource("ClassRoster", ofType: ".plist")
		let rosterData = NSArray(contentsOfFile: filePath)
		
		//		Testing, this allowed me to know it worked.
		//		for var index = 0; index < rosterData.count; index++ {
		//			println(rosterData[index])
		//		}
		
		//This next was the hump I needed to traverse. Pretty much it checks if the entry for the NSArray is a Dictionary<String,String>, this puts that into a person object, it is safe (ignoring the as String or the unwrap (just showing both ways it can be done) because of the optional as? statement in the if statement.
		for entry in rosterData {
			if let person = entry as? Dictionary<String, String> {
				//Probably a bug, the other way to do it is the init the objects in the append method with a unwrap.
				//I wrote both ways to do it (atm) because I feel that it'll be good to look at side by side.
				let first = person["firstName"] as String
				let last = person["lastName"]
				roster.append(Person(firstName: first, lastName: last!))
			}
		}
		
		return roster
		
	}
}