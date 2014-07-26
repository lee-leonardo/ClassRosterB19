//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/22/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit
//import QuartzCore

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

//MARK: Properties
	@IBOutlet weak var firstName: UITextField!
	@IBOutlet weak var lastName: UITextField!
	@IBOutlet weak var personImage: UIImageView!
	@IBOutlet weak var twitterHandle: UITextField!
	@IBOutlet weak var githubHandle: UITextField!
	
	let navPadding = 100
	var person: Person!

//MARK: ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = person.firstName + " " + person.lastName
		
		
		self.firstName.text = person.firstName
		self.lastName.text = person.lastName
		self.twitterHandle.text = person.twitterHandle
		self.githubHandle.text = person.githubHandle
		
		//Attributed to Jeff Gaylefor his hard coded bar button Item.
		let pictureButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "choosePhoto")
		self.navigationItem.rightBarButtonItem = pictureButton
		
		//These only fire if the person has these option statements. It leaves the area blank if it does not have a value.
		//This is fine here because this is data. Use viewWillAppear if I am manipulating the view (or building it from scratch).
//		if let path = self.person.imagePath {
//			
//		} else {
			self.personImage.image = self.person.imageTemp
//		}
		self.personImage.layer.borderWidth = 1.0
		self.personImage.layer.borderColor = UIColor.lightGrayColor().CGColor
		
		//Delegates... why does it work now? !!! Question!!! Answer: Delegate can be set in Storyboard.
		//self.firstName.delegate = self
		//self.lastName.delegate = self
		//self.twitterHandle.delegate = self
		self.githubHandle.delegate = self

    }
	override func viewWillAppear(animated: Bool) {
		//These are here because they are manipulating the views and the data.
		self.personImage.layer.cornerRadius = 0.5 * personImage.frame.width
		self.personImage.layer.masksToBounds = true
		
	}
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		//Looking at this again... I know it passes a reference... but how do I know if it is a reference of a copy?
		//Answer: This is a reference, because we know it is an object that is being modified. It would be copy if it was a struct/primitive
		person.firstName = firstName.text
		person.lastName = lastName.text
//		person.imagePath = personImage
		person.imageTemp = personImage.image
		person.twitterHandle = twitterHandle.text
		person.githubHandle = githubHandle.text
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
//MARK: UITextFieldDelegate
	//Tried to do this from notes, I had to copy...
	func textFieldDidBeginEditing(textField: UITextField!) {
//		println("Being editing")
		
		//So the trick I figure out takes the bounds of the container view, and moves all subViews in relation to it. Wonderful trick! Gotta commit it to my skills.
		let baseWidth = self.view.bounds.width
		let baseHeight = self.view.bounds.height
		let newY = 0 + textField.frame.origin.y - self.navPadding //This is a bit tricky, so it's a good trick to remember.
		let currentX = self.view.bounds.origin.x
		
		//Got to read more about closures and master using them.
		UIView.animateWithDuration(0.3, animations:{ () -> Void
			in
				self.view.bounds = CGRect(x: currentX, y: newY, width: baseWidth, height: baseHeight)
//			Offset
//				self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, -120.0)
		})
	}
	func textFieldDidEndEditing(textField: UITextField!) {
//		println("End Editing")
		
		let currentWidth = self.view.bounds.width
		let currentHeight = self.view.bounds.height
		UIView.animateWithDuration(0.3, animations:{ () -> Void
			in
				self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height: currentHeight)
			})

		//Demonstrates how to do this with CGAffines and using the expression closures special syntax.
//		UIView.animateWithDuration(0.3) {
//			self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height: currentHeight)
//			self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, 120.0)
//			}
		
	}
	func textFieldShouldReturn(textField: UITextField!) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
//MARK: TouchMethods
	override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
		for control in self.view.subviews {
			if let theControl = control as? UITextField {
				theControl.resignFirstResponder()
			}
		}
	}
	
//MARK: UIImagePicker and Control
	func choosePhoto() {
//		1. Is source type available
//		2. Check media,
//		3.?
//		4.Present UI with the presentViewController:animated:completion
//		This is done using a popover.
		
		println("Choose Photo fires off.")
		
		var photoPicker = UIImagePickerController()
		photoPicker.delegate = self
//		photoPicker.editing = true
		
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
			photoPicker.sourceType = UIImagePickerControllerSourceType.Camera
		} else {
//			photoPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
			photoPicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
		}
		
		self.presentViewController(photoPicker, animated: true, completion: nil)
	}
	
	//Taking what Jeff did with this. I am adding functionality to save this Image to my documents directory, where I'll grab a URL to use a imagePath.
	func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
//		println("Did Finish Picking fires off.")
//		println("Info Object:\n\(info)\n\n")
		
		let media = info[UIImagePickerControllerOriginalImage] as UIImage
//		println("Media Object:\n\(media)")
//		println("\(media.imageAsset)")
		
		self.personImage.image = media
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
}










