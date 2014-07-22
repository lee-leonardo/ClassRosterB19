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
		//John Clem
		//Brad Johnson
		//Jeff Gayle
		//Leonardo Lee
		//Mike Tirenin
		//Victor Adu
		//Kirby Shabaga
		//Collin Atherton
		//Alex Rice
		//Dan Hoang
		
		roster.append(Person(firstName: "John", lastName: "Clem"))
		roster.append(Person(firstName: "Brad", lastName: "Johnson"))
		roster.append(Person(firstName: "Mike", lastName: "Tirenin"))
		roster.append(Person(firstName: "Victor", lastName: "Abu"))
		roster.append(Person(firstName: "Kirby", lastName: "Shabaga"))
		roster.append(Person(firstName: "Collin", lastName: "Atherton"))
		roster.append(Person(firstName: "Alex", lastName: "Rice"))
		roster.append(Person(firstName: "Dan", lastName: "Hoang"))
		
		
//		1. Make the array an array of dictionaries... do it as HW! Its a bit more complicated than what we have atm.
		
//		var filePath = NSBundle.mainBundle().pathForResource("ClassRoster", ofType: ".plist")
//		var stringRoster = NSArray(contentsOfFile: filePath)
//		for var index = 0; index < stringRoster.count; index++ {
//			println(stringRoster[index])
//			temporaryClassRoster.append(stringRoster[index] as NSString)
//		}
		
		for person in classRoster {
			println(person.firstName + " " + person.lastName)
		}
		return roster
	}


}

