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

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.firstName.text = person.firstName
		self.lastName.text = person.lastName

    }
	override func viewWillDisappear(animated: Bool) {
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
}
