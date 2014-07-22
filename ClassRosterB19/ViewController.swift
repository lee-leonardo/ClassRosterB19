//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
	
	var people = Person.loadRosterFromPlist()
	@IBOutlet var tableView : UITableView?

	//These will be replaced with the tableView and plist related methods.
	var classRoster : Array<Person> = []

	override func viewDidLoad() {
		super.viewDidLoad()
		//This is how you set it up within the code, not just in Storyboard.
		//self.tableView!.dataSource = self
		//self.tableView!.delegate = self
		
		//if classRoster.isEmpty {
		//classRoster = createClassRoster()
		//}
	}
	override func viewWillAppear(animated: Bool) {
		tableView?.reloadData() //Can use the unwrap, but it is less safe.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
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
	
	
	override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
		let indexPath = tableView!.indexPathForSelectedRow()

		if segue.identifier == "ShowDetail" {
			let destination = segue.destinationViewController as DetailViewController
			destination.person = people[indexPath.row]
			tableView?.deselectRowAtIndexPath(indexPath, animated: true)
		}
	}
	
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return people.count
	}
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as UITableViewCell
		let personForRow = people[indexPath.row]

		cell.textLabel.text = personForRow.firstName
		cell.detailTextLabel.text = personForRow.lastName
		
		//This will fire if the person has an image.
		if let personImage = personForRow.image {
			cell.imageView.image = personImage
		}
		
		return cell
	}

}

