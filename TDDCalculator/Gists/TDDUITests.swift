//
//  TDDUITests.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

/// Performs an addition calculation and checks the answer
func testAddition() throws {
  XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
  
  //Single digit calculation
  var answer = calculate(2, .plus, 2)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  
  //Multiple digit calculation
  answer = calculate(12, .plus, 12)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
}

/// Performs a subtraction calculation and checks the answer
func testSubtraction() throws {
  XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
  
  //Single digit calculation
  var answer = calculate(3, .minus, 2)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  
  //Multiple digit calculation
  answer = calculate(13, .minus, 12)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
}

/// Performs an multiplication calculation and checks the answer
func testMultiplication() throws {
  XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
  
  //Single digit calculation
  var answer = calculate(3, .times, 3)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  
  //Multiple digit calculation
  answer = calculate(13, .times, 13)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
}

/// Performs an division calculation and checks the answer
func testDivision() throws {
  XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
  
  //Single digit calculation
  var answer = calculate(3, .divide, 3)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  
  //Multiple digit calculation
  answer = calculate(33, .divide, 11)
  XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
}
