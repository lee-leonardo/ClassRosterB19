//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
//MARK: Properties
	var people = Person.loadRosterFromPlist()
	@IBOutlet var tableView : UITableView?

	//These will be replaced with the tableView and plist related methods.
	var classRoster : Array<Person> = []

//MARK: ViewController Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "B-19:iOS"
		
		
		//Programmatic adding of an add button: UIBarButtonItem - Ask Jeff
		
		//This is how you set it up within the code, not just in Storyboard.
		//self.tableView!.dataSource = self
		//self.tableView!.delegate = self
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

//MARK: Segue (Omitted)
//	override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//		let indexPath = tableView!.indexPathForSelectedRow()
//
//		if segue.identifier == "ShowDetail" {
//			let destination = segue.destinationViewController as DetailViewController
//			destination.person = people[indexPath.row]
//			tableView?.deselectRowAtIndexPath(indexPath, animated: true)
//		}
//	}
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return people.count
	}
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as UITableViewCell
		let personForRow = people[indexPath.row]

		cell.textLabel.text = personForRow.firstName
		cell.detailTextLabel.text = personForRow.lastName
		
		//Addtional Feature.
		//Cleaner way to assign an image to an imagePath, returns nil (default value) if there's not an imagePath.
		//cell.imageView.image = UIImage(named: "lamb")
		cell.imageView.image = UIImage(named: personForRow.imagePath)

		return cell
	}
	
//MARK: UITableViewDelegate
	func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		let detail = self.storyboard.instantiateViewControllerWithIdentifier("Detail") as DetailViewController
		detail.person = self.people[indexPath.row]
		if self.navigationController {
			self.navigationController.pushViewController(detail, animated: true)
		}
	}

}

