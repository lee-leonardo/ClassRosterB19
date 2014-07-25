//
//  ExtDocumentsDirectory.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/25/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

extension UIViewController {
	//MARK: Documents Directory
	func documentsDirectory() -> String {
		//These are to prevent crashes.
		var documentDirectory = NSSearchPathDirectory.DocumentDirectory
		var userDomainMask = NSSearchPathDomainMask.UserDomainMask
		
		//This is here to actually do.
		var path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true) as NSArray
		var documentsDirectory = path.firstObject as String
		return documentsDirectory
	}
	
	func dataFilePath() -> String {
		return self.documentsDirectory().stringByAppendingPathComponent("ClassRosterB19.plist")
	}
}
