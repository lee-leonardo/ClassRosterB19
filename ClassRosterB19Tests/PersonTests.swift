//
//  PersonTests.swift
//  ClassRosterB19
//
//  Created by Leonardo Lee on 7/21/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit
import XCTest

class PersonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testPersonCreation() {
		var person = Person(firstName: "John", lastName: "Doe")
		XCTAssertNotNil(person, "Person cannot be created.")
		
	}
	
	func testFirstName() {
		var person = Person(firstName: "Alex", lastName: "Lee")
//		person .firstName = "Brad"
		XCTAssertNotNil(person.firstName, "Person does not have a name!")
	}
	
	func testPersonInit() {
		var person = Person(firstName: "Brad", lastName: "Johnson")
		XCTAssertNotNil(person, "Person cannot be created")
	}
	
	func testFullName() {
		var first = "Doug"
		var last = "Baldwin"
		
		var person = Person(firstName: first, lastName: last)
		XCTAssertEqual(person.fullName(), first+last, "Full name is not matching!")
	}
	
	func testImage() {
		var person = Person(firstName: "Leo", lastName: "Lee", imagePath: "lamb")
		XCTAssertNotNil(person.imagePath, "Does not return a value")
		
		//One can only assert values, so... either assign or return a value.
//		XCTAssertNotNil(person.image, "No Image available!")
		//The way it works with a function with a return value.
	}
}
