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
		
		if classRoster.isEmpty {
			classRoster = createClassRoster()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func createClassRoster() -> [Person] {
		var roster = [Person]()
		//John Clem, Brad Johnson, Jeff Gayle, Leonardo Lee, Mike Tirenin, Victor Adu, Kirby Shabaga, Collin Atherton, Alex Rice, Dan Hoang
		
//		For part 4.
//		roster.append(Person(firstName: "John", lastName: "Clem"))
//		roster.append(Person(firstName: "Brad", lastName: "Johnson"))
//		roster.append(Person(firstName: "Mike", lastName: "Tirenin"))
//		roster.append(Person(firstName: "Victor", lastName: "Abu"))
//		roster.append(Person(firstName: "Kirby", lastName: "Shabaga"))
//		roster.append(Person(firstName: "Collin", lastName: "Atherton"))
//		roster.append(Person(firstName: "Alex", lastName: "Rice"))
//		roster.append(Person(firstName: "Dan", lastName: "Hoang"))
//		
//		for person in classRoster {
//			println(person.firstName + " " + person.lastName)
//		}
		
//		For the challenge.
		var classRoster = [Person]()
		var filePath = NSBundle.mainBundle().pathForResource("ClassRoster", ofType: ".plist")
		var rosterData = NSArray(contentsOfFile: filePath)
		
		for var index = 0; index < rosterData.count; index++ {
			println(rosterData[index])
//			Didn't work.
//			var entry = rosterData[index] as Dictionary
//			var rosterEntry = stringRoster[index]
//			println("Roster Entry Object: ", rosterEntry)
//			var firstName = rosterEntry["firstName"]
//			var lastName = stringRoster[index]["lastName"]
//			var image = stringRoster[index]["image"]
		}
		
		return roster
	}


}

