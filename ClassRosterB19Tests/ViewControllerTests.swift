//
//  ViewControllerTests.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testCreateArray() {
		var controller = ViewController()
		controller.classRoster = controller.createClassRoster()
		var compareRoster = controller.createClassRoster()
		1
		for var index = 0; index < compareRoster.count; index++ {
			XCTAssertEqual(compareRoster[index].firstName, controller.classRoster[index].firstName, "Roster's are not the same!")
			XCTAssertEqual(compareRoster[index].lastName, controller.classRoster[index].lastName, "Roster's are not the same!")
		}
	}
	func testStringArrayFromPlist() {
		var controller = ViewController()
		controller.viewDidLoad()

		XCTAssertNotNil(controller.classRoster, "Roster does not exist!")
	}
	func testTableViewImage() {
		var controller = ViewController()
		controller.viewDidLoad()
		
	}
	func testDocumentsDirectory() {
		var controller = ViewController()
		controller.viewDidLoad()
		
		var doc = controller.documentsDirectory()
		//println("\(doc)")
		var path = controller.dataFilePath()
		//println("\(path)")
		
		XCTAssertNotNil(doc, "Documents Directory Exists")
		XCTAssertNotNil(path, "Data File Path exists")
		
	}

}
