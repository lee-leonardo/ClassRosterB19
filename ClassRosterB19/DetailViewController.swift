//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/22/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//MARK: Properties
	var person: Person!
	@IBOutlet weak var firstName: UITextField!
	@IBOutlet weak var lastName: UITextField!
	@IBOutlet weak var personImage: UIImageView!
	@IBOutlet weak var twitterHandle: UITextField!
	@IBOutlet weak var githubHandle: UITextField!

//MARK: ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = person.firstName + " " + person.lastName
		
		
		self.firstName.text = person.firstName
		self.lastName.text = person.lastName

		//These only fire if the person has these option statements. It leaves the area blank if it does not have a value.
		self.personImage.image = UIImage(named: person.imagePath)
		self.personImage.layer.cornerRadius = 0.5 * personImage.frame.width
		self.personImage.layer.masksToBounds = true
		self.personImage.layer.borderWidth = 1.0
		self.personImage.layer.borderColor = UIColor.lightGrayColor().CGColor
		
		self.twitterHandle.text = person.twitterHandle
		self.githubHandle.text = person.githubHandle

    }
//	override func viewWillAppear(animated: Bool) {
//		
//	}
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		//Looking at this again... I know it passes a reference... but how do I know if it is a reference of a copy?
		//Answer: This is a reference, because we know it is an object that is being modified. It would be copy if it was a struct/primitive
		person.firstName = firstName.text
		person.lastName = lastName.text
//		person.imagePath = personImage
		person.twitterHandle = twitterHandle.text
		person.githubHandle = githubHandle.text
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
}
