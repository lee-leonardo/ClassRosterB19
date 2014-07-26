//
//  ExtDocumentsDirectory.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/25/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

//Going to be omitted... I'll save this for something else, but I am not persisting data.
extension UIViewController {
	//MARK: Documents Directory
	func documentsDirectory() -> String {
		//These are to prevent crashes.
		var documentDirectory = NSSearchPathDirectory.DocumentDirectory
		var userDomainMask = NSSearchPathDomainMask.UserDomainMask //Apparently this is a bitwise value (this form is more readable.
		
		//This is here to actually do.
		var path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true) as NSArray
		var documentsDirectory = path.firstObject as String
		return documentsDirectory
	}
	
	func dataFilePath() -> String {
		return self.documentsDirectory().stringByAppendingPathComponent("ClassRosterB19.plist")
	}
	
//MARK: Saving
	func saveData(rosterData: AnyObject) {
		var data = NSMutableData()
		var archiver = NSKeyedArchiver(forWritingWithMutableData: data)
		
		archiver.encodeObject(rosterData, forKey: "ClassRosterB19")
		archiver.finishEncoding()
		data.writeToFile(self.dataFilePath(), atomically: true)
	}
}
