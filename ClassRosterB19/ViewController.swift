//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var classRoster : Array<Person> = []
	var temporaryClassRoster = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		if classRoster.isEmpty {
//			classRoster = createClassRoster()
//		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func createClassRoster() -> [Person] {
		var roster = [Person]()
		//John Clem, Brad Johnson, Jeff Gayle, Leonardo Lee, Mike Tirenin, Victor Adu, Kirby Shabaga, Collin Atherton, Alex Rice, Dan Hoang
		
		//For part 4.
		roster.append(Person(firstName: "John", lastName: "Clem"))
		roster.append(Person(firstName: "Brad", lastName: "Johnson"))
		roster.append(Person(firstName: "Mike", lastName: "Tirenin"))
		roster.append(Person(firstName: "Victor", lastName: "Abu"))
		roster.append(Person(firstName: "Kirby", lastName: "Shabaga"))
		roster.append(Person(firstName: "Collin", lastName: "Atherton"))
		roster.append(Person(firstName: "Alex", lastName: "Rice"))
		roster.append(Person(firstName: "Dan", lastName: "Hoang"))
		
		for person in classRoster {
			println(person.firstName + " " + person.lastName)
		}
		return roster
	}
	
//	Attributed to Kirby Shabaga, explanation by John Clem.
	func loadRosterFromPlist() -> Array<Person> {
		//For the challenge.
		var roster = [Person]()
		
		let filePath = NSBundle.mainBundle().pathForResource("ClassRoster", ofType: ".plist")
		let rosterData = NSArray(contentsOfFile: filePath)
		
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

