//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/22/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	var person: Person!
	@IBOutlet weak var firstName: UITextField!
	@IBOutlet weak var lastName: UITextField!
	@IBOutlet weak var personImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.firstName.text = person.firstName
		self.lastName.text = person.lastName
		
		//Testing for UIImage
		//self.personImage.image = UIImage(named: "lamb")
		
		if let personImage = person.imagePath? {
			self.personImage.image = UIImage(named: personImage)
		}

    }
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		//Looking at this again... I know it passes a reference... but how do I know if it is a reference of a copy?
		//Answer: This is a reference, because we know it is an object that is being modified. It would be copy if it was a struct/primitive
		person.firstName = firstName.text
		person.lastName = lastName.text
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
}
